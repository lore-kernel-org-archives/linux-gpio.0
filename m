From: =?ISO-8859-1?Q?Martin_Hundeb=F8ll?= <martin.hundeboll@prevas.dk>
Subject: Re: [PATCH] tools/gpio: add gpio util to get or set gpio lines
Date: Thu, 03 Aug 2017 10:31:45 +0200
Message-ID: <B76AFF4C-51DC-4FC5-85C4-4F9D4404C8A5@prevas.dk>
References: <20170724143218.8510-1-mnhu@prevas.dk> <CACRpkdYMfaZDd3Tp-MfdtEpYLYWFJgGVKzwhjp1-swoufuzWrQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail02.prevas.se ([62.95.78.10]:63955 "EHLO mail02.prevas.se"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751131AbdHCInh (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 3 Aug 2017 04:43:37 -0400
In-Reply-To: <CACRpkdYMfaZDd3Tp-MfdtEpYLYWFJgGVKzwhjp1-swoufuzWrQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>, =?ISO-8859-1?Q?Martin_Hundeb=F8ll?= <mnhu@prevas.dk>, Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>



On August 3, 2017 9:56:00 AM GMT+02:00, Linus Walleij <linus=2Ewalleij@lin=
aro=2Eorg> wrote:
>On Mon, Jul 24, 2017 at 4:32 PM, Martin Hundeb=C3=B8ll <mnhu@prevas=2Edk>
>wrote:
>
>> Add a new tool to set or get the value of one or more gpio lines,
>which
>> can as either chip offsets or line names=2E This makes it easier to
>> control gpio lines from user space without using the cumbersome sysfs
>> interface=2E It also demostrates how gpio-line-names can be used to
>> decouple software from hardware layout=2E
>>
>> Signed-off-by: Martin Hundeb=C3=B8ll <mnhu@prevas=2Edk>
>
>How does this relate to Bartosz userspace library libgpiod?
>Have you checked it and considered using it?
>https://github=2Ecom/brgl/libgpiod

I tried with the best of my Google Foo, but "gpio" is a bit too generic=2E=
 libgpiod is exactly what I need, thanks=2E

>
>>  tools/gpio/gpio=2Ec     | 261
>++++++++++++++++++++++++++++++++++++++++++++++++++
>
>We can't have a tool simply named "gpio" it is too unspecific=2E
>
>Come up with a better name for this, such as "gpiog-get-set" or so=2E
>
>Maybe it should be two tools? One fo setting and one for getting a
>line?

Correct=2E I can update the patch into two utils, but with libgpiod in the=
 mix, we can just drop this?

// Martin

>
>> + * lsgpio - example on how to list the GPIO lines on a system
>> + *
>> + * Copyright (C) 2015 Linus Walleij
>> + *
>> + * This program is free software; you can redistribute it and/or
>modify it
>> + * under the terms of the GNU General Public License version 2 as
>published by
>> + * the Free Software Foundation=2E
>> + *
>> + * Usage:
>> + *     lsgpio <-n device-name>
>
>There is a lot of copy-paste going on here=2E Please fix it up=2E
>
>> +int print_offsets(const char *device_name, unsigned int *lines, int
>nlines)
>> +{
>> +       struct gpiohandle_data data;
>> +       int i, line, value, ret;
>> +
>> +       ret =3D gpiotools_gets(device_name, lines, nlines, &data);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* print value for each configured line */
>> +       printf("GPIO chip: %s\n", device_name);
>> +       for (i =3D 0; i < nlines; i++) {
>> +               line =3D lines[i];
>> +               value =3D data=2Evalues[line];
>> +               printf("\tline %i: %i\n", lines[i], value);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +int print_labels(const char *device_name, unsigned int *lines,
>> +                 const char *labels[], int nlabels)
>> +{
>> +       struct gpiohandle_data data;
>> +       int i, value, ret;
>> +       const char *label;
>> +
>> +       ret =3D gpiotools_gets(device_name, lines, nlabels, &data);
>> +       if (ret)
>> +               return ret;
>> +
>> +       /* print value for each configured label */
>> +       printf("GPIO chip: %s\n", device_name);
>> +       for (i =3D 0; i < nlabels; i++) {
>> +               label =3D labels[i];
>> +               value =3D data=2Evalues[i];
>> +               printf("\t%s: %i\n", label, value);
>> +       }
>> +
>> +       return ret;
>> +}
>> +
>> +int control_offsets(const char *device_name, unsigned int *lines,
>int nlines,
>> +                   int flags, int value)
>> +{
>> +       struct gpiohandle_data data =3D {{ value }};
>> +
>> +       if (flags & GPIOHANDLE_REQUEST_INPUT)
>> +               return print_offsets(device_name, lines, nlines);
>> +       else
>> +               return gpiotools_sets(device_name, lines, nlines,
>&data);
>> +}
>> +
>> +int control_labels(const char *device_name, const char *labels[],
>int nlabels,
>> +                  int flags, int value)
>> +{
>> +       struct gpiochip_info cinfo =3D {0};
>> +       char *chrdev_name =3D NULL;
>> +       unsigned int lines[GPIOHANDLES_MAX];
>> +       int nlines =3D 0;
>> +       int ret, fd, i, j;
>> +
>> +       ret =3D asprintf(&chrdev_name, "/dev/%s", device_name);
>> +       if (ret < 0)
>> +               return -ENOMEM;
>> +
>> +       fd =3D open(chrdev_name, 0);
>> +       if (fd =3D=3D -1) {
>> +               ret =3D -errno;
>> +               fprintf(stderr, "Failed to open %s\n", chrdev_name);
>> +               goto exit_error;
>> +       }
>> +
>> +       /* Inspect this GPIO chip */
>> +       ret =3D ioctl(fd, GPIO_GET_CHIPINFO_IOCTL, &cinfo);
>> +       if (ret =3D=3D -1) {
>> +               ret =3D -errno;
>> +               perror("Failed to issue CHIPINFO IOCTL\n");
>> +               goto exit_close_error;
>> +       }
>> +
>> +       /* Loop over the lines and match info */
>> +       for (i =3D 0; i < cinfo=2Elines; i++) {
>> +               struct gpioline_info linfo;
>> +
>> +               memset(&linfo, 0, sizeof(linfo));
>> +               linfo=2Eline_offset =3D i;
>> +
>> +               ret =3D ioctl(fd, GPIO_GET_LINEINFO_IOCTL, &linfo);
>> +               if (ret =3D=3D -1) {
>> +                       ret =3D -errno;
>> +                       perror("Failed to issue LINEINFO IOCTL\n");
>> +                       goto exit_close_error;
>> +               }
>> +
>> +               /* Check if line name is included requested names */
>> +               for (j =3D 0; j < nlabels; j++) {
>> +                       if (strcmp(linfo=2Ename, labels[j]) =3D=3D 0) {
>> +                               lines[nlines++] =3D i;
>> +                               break;
>> +                       }
>> +               }
>> +       }
>> +
>> +       if (nlines =3D=3D 0)
>> +               goto exit_close_error;
>> +
>> +       if (flags & GPIOHANDLE_REQUEST_INPUT) {
>> +               print_labels(device_name, lines, labels, nlabels);
>> +       } else {
>> +               struct gpiohandle_data data =3D {{ value }};
>> +               ret =3D gpiotools_sets(device_name, lines, nlines,
>&data);
>> +       }
>> +
>> +exit_close_error:
>> +       if (fd >=3D 0 && close(fd) =3D=3D -1)
>> +               perror("Failed to close GPIO character device file");
>> +
>> +exit_error:
>> +       free(chrdev_name);
>> +
>> +       return ret;
>> +}
>
>All of this also looks copypasted=2E
>
>Please go through your program and make something very
>specific and to the point that does exactly what you want instead of
>randomly reusing lsgpio=2E
>
>Yours,
>Linus Walleij

--=20
Sent from my Android device with K-9 Mail=2E Please excuse my brevity=2E
