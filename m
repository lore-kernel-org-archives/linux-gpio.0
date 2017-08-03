From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] tools/gpio: add gpio util to get or set gpio lines
Date: Thu, 3 Aug 2017 09:56:00 +0200
Message-ID: <CACRpkdYMfaZDd3Tp-MfdtEpYLYWFJgGVKzwhjp1-swoufuzWrQ@mail.gmail.com>
References: <20170724143218.8510-1-mnhu@prevas.dk>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f50.google.com ([209.85.214.50]:37318 "EHLO
        mail-it0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751043AbdHCH4C (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Aug 2017 03:56:02 -0400
Received: by mail-it0-f50.google.com with SMTP id v127so5340414itd.0
        for <linux-gpio@vger.kernel.org>; Thu, 03 Aug 2017 00:56:02 -0700 (PDT)
In-Reply-To: <20170724143218.8510-1-mnhu@prevas.dk>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: =?UTF-8?Q?Martin_Hundeb=C3=B8ll?= <mnhu@prevas.dk>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Mon, Jul 24, 2017 at 4:32 PM, Martin Hundeb=C3=B8ll <mnhu@prevas.dk> wro=
te:

> Add a new tool to set or get the value of one or more gpio lines, which
> can as either chip offsets or line names. This makes it easier to
> control gpio lines from user space without using the cumbersome sysfs
> interface. It also demostrates how gpio-line-names can be used to
> decouple software from hardware layout.
>
> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas.dk>

How does this relate to Bartosz userspace library libgpiod?
Have you checked it and considered using it?
https://github.com/brgl/libgpiod

>  tools/gpio/gpio.c     | 261 ++++++++++++++++++++++++++++++++++++++++++++=
++++++

We can't have a tool simply named "gpio" it is too unspecific.

Come up with a better name for this, such as "gpiog-get-set" or so.

Maybe it should be two tools? One fo setting and one for getting a line?

> + * lsgpio - example on how to list the GPIO lines on a system
> + *
> + * Copyright (C) 2015 Linus Walleij
> + *
> + * This program is free software; you can redistribute it and/or modify =
it
> + * under the terms of the GNU General Public License version 2 as publis=
hed by
> + * the Free Software Foundation.
> + *
> + * Usage:
> + *     lsgpio <-n device-name>

There is a lot of copy-paste going on here. Please fix it up.

> +int print_offsets(const char *device_name, unsigned int *lines, int nlin=
es)
> +{
> +       struct gpiohandle_data data;
> +       int i, line, value, ret;
> +
> +       ret =3D gpiotools_gets(device_name, lines, nlines, &data);
> +       if (ret)
> +               return ret;
> +
> +       /* print value for each configured line */
> +       printf("GPIO chip: %s\n", device_name);
> +       for (i =3D 0; i < nlines; i++) {
> +               line =3D lines[i];
> +               value =3D data.values[line];
> +               printf("\tline %i: %i\n", lines[i], value);
> +       }
> +
> +       return ret;
> +}
> +
> +int print_labels(const char *device_name, unsigned int *lines,
> +                 const char *labels[], int nlabels)
> +{
> +       struct gpiohandle_data data;
> +       int i, value, ret;
> +       const char *label;
> +
> +       ret =3D gpiotools_gets(device_name, lines, nlabels, &data);
> +       if (ret)
> +               return ret;
> +
> +       /* print value for each configured label */
> +       printf("GPIO chip: %s\n", device_name);
> +       for (i =3D 0; i < nlabels; i++) {
> +               label =3D labels[i];
> +               value =3D data.values[i];
> +               printf("\t%s: %i\n", label, value);
> +       }
> +
> +       return ret;
> +}
> +
> +int control_offsets(const char *device_name, unsigned int *lines, int nl=
ines,
> +                   int flags, int value)
> +{
> +       struct gpiohandle_data data =3D {{ value }};
> +
> +       if (flags & GPIOHANDLE_REQUEST_INPUT)
> +               return print_offsets(device_name, lines, nlines);
> +       else
> +               return gpiotools_sets(device_name, lines, nlines, &data);
> +}
> +
> +int control_labels(const char *device_name, const char *labels[], int nl=
abels,
> +                  int flags, int value)
> +{
> +       struct gpiochip_info cinfo =3D {0};
> +       char *chrdev_name =3D NULL;
> +       unsigned int lines[GPIOHANDLES_MAX];
> +       int nlines =3D 0;
> +       int ret, fd, i, j;
> +
> +       ret =3D asprintf(&chrdev_name, "/dev/%s", device_name);
> +       if (ret < 0)
> +               return -ENOMEM;
> +
> +       fd =3D open(chrdev_name, 0);
> +       if (fd =3D=3D -1) {
> +               ret =3D -errno;
> +               fprintf(stderr, "Failed to open %s\n", chrdev_name);
> +               goto exit_error;
> +       }
> +
> +       /* Inspect this GPIO chip */
> +       ret =3D ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo);
> +       if (ret =3D=3D -1) {
> +               ret =3D -errno;
> +               perror("Failed to issue CHIPINFO IOCTL\n");
> +               goto exit_close_error;
> +       }
> +
> +       /* Loop over the lines and match info */
> +       for (i =3D 0; i < cinfo.lines; i++) {
> +               struct gpioline_info linfo;
> +
> +               memset(&linfo, 0, sizeof(linfo));
> +               linfo.line_offset =3D i;
> +
> +               ret =3D ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
> +               if (ret =3D=3D -1) {
> +                       ret =3D -errno;
> +                       perror("Failed to issue LINEINFO IOCTL\n");
> +                       goto exit_close_error;
> +               }
> +
> +               /* Check if line name is included requested names */
> +               for (j =3D 0; j < nlabels; j++) {
> +                       if (strcmp(linfo.name, labels[j]) =3D=3D 0) {
> +                               lines[nlines++] =3D i;
> +                               break;
> +                       }
> +               }
> +       }
> +
> +       if (nlines =3D=3D 0)
> +               goto exit_close_error;
> +
> +       if (flags & GPIOHANDLE_REQUEST_INPUT) {
> +               print_labels(device_name, lines, labels, nlabels);
> +       } else {
> +               struct gpiohandle_data data =3D {{ value }};
> +               ret =3D gpiotools_sets(device_name, lines, nlines, &data)=
;
> +       }
> +
> +exit_close_error:
> +       if (fd >=3D 0 && close(fd) =3D=3D -1)
> +               perror("Failed to close GPIO character device file");
> +
> +exit_error:
> +       free(chrdev_name);
> +
> +       return ret;
> +}

All of this also looks copypasted.

Please go through your program and make something very
specific and to the point that does exactly what you want instead of
randomly reusing lsgpio.

Yours,
Linus Walleij
