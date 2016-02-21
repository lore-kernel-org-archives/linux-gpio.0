From: Markus Pargmann <mpa@pengutronix.de>
Subject: Re: [PATCH] gpio: add userspace ABI for GPIO line information
Date: Sun, 21 Feb 2016 13:32:30 +0100
Message-ID: <1741424.Z9iNUuKYjD@galactica>
References: <1455313162-22956-1-git-send-email-linus.walleij@linaro.org>
Mime-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart4609587.5imqPklCJh"; micalg="pgp-sha256"; protocol="application/pgp-signature"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from metis.ext.4.pengutronix.de ([92.198.50.35]:53567 "EHLO
	metis.ext.4.pengutronix.de" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752639AbcBURXB (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>);
	Sun, 21 Feb 2016 12:23:01 -0500
In-Reply-To: <1455313162-22956-1-git-send-email-linus.walleij@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: linux-gpio@vger.kernel.org, Alexandre Courbot <acourbot@nvidia.com>, Johan Hovold <johan@kernel.org>, Michael Welling <mwelling@ieee.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Grant Likely <grant.likely@linaro.org>

--nextPart4609587.5imqPklCJh
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="us-ascii"

Hi,

On Friday 12 February 2016 22:39:22 Linus Walleij wrote:
> This adds a GPIO line ABI for getting name, label and a few select
> flags from the kernel.
>=20
> This hides the kernel internals and only tells userspace what it
> may need to know: the different in-kernel consumers are masked
> behind the flag "kernel" and that is all userspace needs to know.
>=20
> However electric characteristics like active low, open drain etc
> are reflected to userspace, as this is important information.
>=20
> We provide information on all lines on all chips, later on we will
> likely add a flag for the chardev consumer so we can filter and
> display only the lines userspace actually uses in e.g. lsgpio,
> but then we first need an ABI for userspace to grab and use
> (get/set/select direction) a GPIO line.
>=20
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>

The patch looks good. Just as an idea: we could extend GPIO_GET_LINEINF=
O_IOCTL
to search for the name/label of the GPIO. This would only be done if th=
e struct
gpioline_info has a valid name in the 'name' or 'label' fields. This wo=
uld
reduce the number of ioctls if the userspace searches for a specific GP=
IO on a
GPIOCHIP.

Best Regards,

Markus

> ---
>  drivers/gpio/gpiolib.c    | 50 +++++++++++++++++++++++++--
>  include/uapi/linux/gpio.h | 26 ++++++++++++++
>  tools/gpio/gpio-utils.h   |  2 ++
>  tools/gpio/lsgpio.c       | 88 +++++++++++++++++++++++++++++++++++++=
+++-------
>  4 files changed, 152 insertions(+), 14 deletions(-)
>=20
> diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
> index a022e9249f69..6138df74f148 100644
> --- a/drivers/gpio/gpiolib.c
> +++ b/drivers/gpio/gpiolib.c
> @@ -331,14 +331,15 @@ static long gpio_ioctl(struct file *filp, unsig=
ned int cmd, unsigned long arg)
>  =09struct gpio_device *gdev =3D filp->private_data;
>  =09struct gpio_chip *chip =3D gdev->chip;
>  =09int __user *ip =3D (int __user *)arg;
> -=09struct gpiochip_info chipinfo;
> =20
>  =09/* We fail any subsequent ioctl():s when the chip is gone */
>  =09if (!chip)
>  =09=09return -ENODEV;
> =20
> +=09/* Fill in the struct and pass to userspace */
>  =09if (cmd =3D=3D GPIO_GET_CHIPINFO_IOCTL) {
> -=09=09/* Fill in the struct and pass to userspace */
> +=09=09struct gpiochip_info chipinfo;
> +
>  =09=09strncpy(chipinfo.name, dev_name(&gdev->dev),
>  =09=09=09sizeof(chipinfo.name));
>  =09=09chipinfo.name[sizeof(chipinfo.name)-1] =3D '\0';
> @@ -349,6 +350,51 @@ static long gpio_ioctl(struct file *filp, unsign=
ed int cmd, unsigned long arg)
>  =09=09if (copy_to_user(ip, &chipinfo, sizeof(chipinfo)))
>  =09=09=09return -EFAULT;
>  =09=09return 0;
> +=09} else if (cmd =3D=3D GPIO_GET_LINEINFO_IOCTL) {
> +=09=09struct gpioline_info lineinfo;
> +=09=09struct gpio_desc *desc;
> +
> +=09=09if (copy_from_user(&lineinfo, ip, sizeof(lineinfo)))
> +=09=09=09return -EFAULT;
> +=09=09if (lineinfo.line_offset > gdev->ngpio)
> +=09=09=09return -EINVAL;
> +
> +=09=09desc =3D &gdev->descs[lineinfo.line_offset];
> +=09=09if (desc->name) {
> +=09=09=09strncpy(lineinfo.name, desc->name,
> +=09=09=09=09sizeof(lineinfo.name));
> +=09=09=09lineinfo.name[sizeof(lineinfo.name)-1] =3D '\0';
> +=09=09} else {
> +=09=09=09lineinfo.name[0] =3D '\0';
> +=09=09}
> +=09=09if (desc->label) {
> +=09=09=09strncpy(lineinfo.label, desc->label,
> +=09=09=09=09sizeof(lineinfo.label));
> +=09=09=09lineinfo.label[sizeof(lineinfo.label)-1] =3D '\0';
> +=09=09} else {
> +=09=09=09lineinfo.label[0] =3D '\0';
> +=09=09}
> +
> +=09=09/*
> +=09=09 * Userspace only need to know that the kernel is using
> +=09=09 * this GPIO so it can't use it.
> +=09=09 */
> +=09=09if (desc->flags & (FLAG_REQUESTED | FLAG_IS_HOGGED |
> +=09=09=09=09   FLAG_USED_AS_IRQ | FLAG_EXPORT |
> +=09=09=09=09   FLAG_SYSFS))
> +=09=09=09lineinfo.flags |=3D GPIOLINE_FLAG_KERNEL;
> +=09=09if (desc->flags & FLAG_IS_OUT)
> +=09=09=09lineinfo.flags |=3D GPIOLINE_FLAG_IS_OUT;
> +=09=09if (desc->flags & FLAG_ACTIVE_LOW)
> +=09=09=09lineinfo.flags |=3D GPIOLINE_FLAG_ACTIVE_LOW;
> +=09=09if (desc->flags & FLAG_OPEN_DRAIN)
> +=09=09=09lineinfo.flags |=3D GPIOLINE_FLAG_OPEN_DRAIN;
> +=09=09if (desc->flags & FLAG_OPEN_SOURCE)
> +=09=09=09lineinfo.flags |=3D GPIOLINE_FLAG_OPEN_SOURCE;
> +
> +=09=09if (copy_to_user(ip, &lineinfo, sizeof(lineinfo)))
> +=09=09=09return -EFAULT;
> +=09=09return 0;
>  =09}
>  =09return -EINVAL;
>  }
> diff --git a/include/uapi/linux/gpio.h b/include/uapi/linux/gpio.h
> index 3f93e1bcd3dd..416ce47f2291 100644
> --- a/include/uapi/linux/gpio.h
> +++ b/include/uapi/linux/gpio.h
> @@ -25,6 +25,32 @@ struct gpiochip_info {
>  =09__u32 lines;
>  };
> =20
> +/* Line is in use by the kernel */
> +#define GPIOLINE_FLAG_KERNEL=09=09(1UL << 0)
> +#define GPIOLINE_FLAG_IS_OUT=09=09(1UL << 1)
> +#define GPIOLINE_FLAG_ACTIVE_LOW=09(1UL << 2)
> +#define GPIOLINE_FLAG_OPEN_DRAIN=09(1UL << 3)
> +#define GPIOLINE_FLAG_OPEN_SOURCE=09(1UL << 4)
> +
> +/**
> + * struct gpioline_info - Information about a certain GPIO line
> + * @line_offset: the local offset on this GPIO device, fill in when
> + * requesting information from the kernel
> + * @flags: various flags for this line
> + * @name: the name of this GPIO line
> + * @label: a functional name for this GPIO line
> + * @kernel: this GPIO is in use by the kernel
> + * @out: this GPIO is an output line (false means it is an input)
> + * @active_low: this GPIO is active low
> + */
> +struct gpioline_info {
> +=09__u32 line_offset;
> +=09__u32 flags;
> +=09char name[32];
> +=09char label[32];
> +};
> +
>  #define GPIO_GET_CHIPINFO_IOCTL _IOR('o', 0x01, struct gpiochip_info=
)
> +#define GPIO_GET_LINEINFO_IOCTL _IOWR('o', 0x02, struct gpioline_inf=
o)
> =20
>  #endif /* _UAPI_GPIO_H_ */
> diff --git a/tools/gpio/gpio-utils.h b/tools/gpio/gpio-utils.h
> index b18209a45ad3..5f57133b8c04 100644
> --- a/tools/gpio/gpio-utils.h
> +++ b/tools/gpio/gpio-utils.h
> @@ -16,6 +16,8 @@
> =20
>  #include <string.h>
> =20
> +#define ARRAY_SIZE(arr) (sizeof(arr) / sizeof((arr)[0]))
> +
>  static inline int check_prefix(const char *str, const char *prefix)
>  {
>  =09return strlen(str) > strlen(prefix) &&
> diff --git a/tools/gpio/lsgpio.c b/tools/gpio/lsgpio.c
> index 692233f561fb..908535cbc403 100644
> --- a/tools/gpio/lsgpio.c
> +++ b/tools/gpio/lsgpio.c
> @@ -26,12 +26,56 @@
> =20
>  #include "gpio-utils.h"
> =20
> +struct gpio_flag {
> +=09char *name;
> +=09unsigned long mask;
> +};
> +
> +struct gpio_flag flagnames[] =3D {
> +=09{
> +=09=09.name =3D "kernel",
> +=09=09.mask =3D GPIOLINE_FLAG_KERNEL,
> +=09},
> +=09{
> +=09=09.name =3D "output",
> +=09=09.mask =3D GPIOLINE_FLAG_IS_OUT,
> +=09},
> +=09{
> +=09=09.name =3D "active-low",
> +=09=09.mask =3D GPIOLINE_FLAG_ACTIVE_LOW,
> +=09},
> +=09{
> +=09=09.name =3D "open-drain",
> +=09=09.mask =3D GPIOLINE_FLAG_OPEN_DRAIN,
> +=09},
> +=09{
> +=09=09.name =3D "open-source",
> +=09=09.mask =3D GPIOLINE_FLAG_OPEN_SOURCE,
> +=09},
> +};
> +
> +void print_flags(unsigned long flags)
> +{
> +=09int i;
> +=09int printed =3D 0;
> +
> +=09for (i =3D 0; i < ARRAY_SIZE(flagnames); i++) {
> +=09=09if (flags & flagnames[i].mask) {
> +=09=09=09if (printed)
> +=09=09=09=09fprintf(stdout, " ");
> +=09=09=09fprintf(stdout, "%s", flagnames[i].name);
> +=09=09=09printed++;
> +=09=09}
> +=09}
> +}
> +
>  int list_device(const char *device_name)
>  {
>  =09struct gpiochip_info cinfo;
>  =09char *chrdev_name;
>  =09int fd;
>  =09int ret;
> +=09int i;
> =20
>  =09ret =3D asprintf(&chrdev_name, "/dev/%s", device_name);
>  =09if (ret < 0)
> @@ -41,32 +85,52 @@ int list_device(const char *device_name)
>  =09if (fd =3D=3D -1) {
>  =09=09ret =3D -errno;
>  =09=09fprintf(stderr, "Failed to open %s\n", chrdev_name);
> -=09=09goto free_chrdev_name;
> +=09=09goto exit_close_error;
>  =09}
> =20
>  =09/* Inspect this GPIO chip */
>  =09ret =3D ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo);
>  =09if (ret =3D=3D -1) {
>  =09=09ret =3D -errno;
> -=09=09fprintf(stderr, "Failed to retrieve GPIO fd\n");
> -=09=09if (close(fd) =3D=3D -1)
> -=09=09=09perror("Failed to close GPIO character device file");
> -
> -=09=09goto free_chrdev_name;
> +=09=09perror("Failed to issue CHIPINFO IOCTL\n");
> +=09=09goto exit_close_error;
>  =09}
>  =09fprintf(stdout, "GPIO chip: %s, \"%s\", %u GPIO lines\n",
>  =09=09cinfo.name, cinfo.label, cinfo.lines);
> =20
> -=09if (close(fd) =3D=3D -1)  {
> -=09=09ret =3D -errno;
> -=09=09goto free_chrdev_name;
> +=09/* Loop over the lines and print info */
> +=09for (i =3D 0; i < cinfo.lines; i++) {
> +=09=09struct gpioline_info linfo;
> +
> +=09=09ret =3D ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
> +=09=09if (ret =3D=3D -1) {
> +=09=09=09ret =3D -errno;
> +=09=09=09perror("Failed to issue LINEINFO IOCTL\n");
> +=09=09=09goto exit_close_error;
> +=09=09}
> +=09=09fprintf(stdout, "\tline %d:", i);
> +=09=09if (linfo.name[0])
> +=09=09=09fprintf(stdout, " %s", linfo.name);
> +=09=09else
> +=09=09=09fprintf(stdout, " unnamed");
> +=09=09if (linfo.label[0])
> +=09=09=09fprintf(stdout, "\"%s\"", linfo.label);
> +=09=09else
> +=09=09=09fprintf(stdout, " unlabeled");
> +=09=09if (linfo.flags) {
> +=09=09=09fprintf(stdout, "[");
> +=09=09=09print_flags(linfo.flags);
> +=09=09=09fprintf(stdout, "]");
> +=09=09}
> +=09=09fprintf(stdout, "\n");
> +
>  =09}
> =20
> -free_chrdev_name:
> +exit_close_error:
> +=09if (close(fd) =3D=3D -1)
> +=09=09perror("Failed to close GPIO character device file");
>  =09free(chrdev_name);
> -
>  =09return ret;
> -
>  }
> =20
>  void print_usage(void)
>=20

=2D-=20
Pengutronix e.K.                           |                           =
  |
Industrial Linux Solutions                 | http://www.pengutronix.de/=
  |
Peiner Str. 6-8, 31137 Hildesheim, Germany | Phone: +49-5121-206917-0  =
  |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-555=
5 |

--nextPart4609587.5imqPklCJh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAABCAAGBQJWya5fAAoJECi9+rkzbKwyHi8QAK3griSEQvUSk+vIELLuUnzO
DucyuaSYG8YgNFyiGpw38V2hAAo5b1Jx1t7bn59vPhqf82xXdN4VhmOofzc/YZbN
SHXfzLFgNbeRYtRrliUpR8+zVdc0mLSQi4+BcJeMq8SjpUSMRTwxWFbIqxWd3jSB
nXYlMU0YI23/fFcx6N6M2H7DY1PWrAjV5rBa6CDz22p20QS0WDURuGxUsMf2VGVm
H2Bi/4sUDipEOX1M4x6zP47PPH+Dou/X8TQ484SG/sE4qtNPm2TBUk7sl0DrZ25t
4dfPme1q36rze87ibWuyQN/1tejH3OyeXXsD+dJNe8wSQ9YcEkA4fWYGOjB/LfFz
sSKuFSzz+XYIr9qyjwNlywyPeb9QtEojXv2rVzFpgz+VQrLzloOMt+zUFs8J9I59
+3SugM5OmHjUzIvHCbLNM5PHGX8ZxFrcLOOsX0N1cnJ2UdJSxEACa4LXF0yZmVP3
yQyLUqwZAp/S2hc02icYdVhq5T7/inu4GEcFGyM8FBU6H8RLC6i1RAGgO0qWTe6U
/Cimwlgo0T9uvmT0dQJ+i3YjHDW+MMR7z7g4YpQ64bB95C7rw2/xcVtfUqCxdLnp
lV/7DI81479Qqt2TmBwS8gHxtKh6ufMXjxgnh4OJuVWYERaeA1b6ywqtSJn83QoM
vl/Gph7hudb+RmXbkU5n
=Be/t
-----END PGP SIGNATURE-----

--nextPart4609587.5imqPklCJh--

