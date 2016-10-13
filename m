From: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Subject: Re: [PATCH v3 2/5] tools/gpio: re-work gpio hammer with gpio operations
Date: Thu, 13 Oct 2016 12:28:01 +0800
Message-ID: <CAFy1USSq12xp4=Mnex1xMJg3xGnEFXDPW3BLbYqbEAZ84zfGPA@mail.gmail.com>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org> <20160831094548.12574-3-bamvor.zhangjian@linaro.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-it0-f43.google.com ([209.85.214.43]:37044 "EHLO
        mail-it0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754822AbcJME3J (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Oct 2016 00:29:09 -0400
Received: by mail-it0-f43.google.com with SMTP id z65so73154319itc.0
        for <linux-gpio@vger.kernel.org>; Wed, 12 Oct 2016 21:28:02 -0700 (PDT)
In-Reply-To: <20160831094548.12574-3-bamvor.zhangjian@linaro.org>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: linux-gpio@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>, Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>, Michael Welling <mwelling@ieee.org>

Hi, Linus, Michael

When I am writing the updated version of gpio-hammer.c(base on the
gpio-util.c we discussed). I am thinking if the gpio line is
aleady output, maybe the user do not want to update the value. But
I found that I must update the default_values in struct
gpiohandle_request if I want to set gpio as output.  Because I could
not set the gpio direction after the gpio line request. And I could
not skip the default value in request. I am thinking if we need to
deal with it.

The first option is add another flag(e.g.
GPIOHANDLE_REQUEST_UPDATE_VALUE) to indicate the update the value of
gpio. This method break the current application which rely on setting
the default_values through GPIOHANDLE_REQUEST_OUTPUT. Another way is
allow user update the flag after request. It need to add flags to
struct linehandle_state.
diff --git a/drivers/gpio/gpiolib.c b/drivers/gpio/gpiolib.c
index 53ff25a..a6965a3 100644
--- a/drivers/gpio/gpiolib.c
+++ b/drivers/gpio/gpiolib.c
@@ -329,6 +329,7 @@ struct linehandle_state {
        const char *label;
        struct gpio_desc *descs[GPIOHANDLES_MAX];
        u32 numdescs;
+       u32 flags;
 };

The easiest way seems set the gpio value to 0 in gpio-hammer.c which
is consistent with behavior of sysfs. But in the real senario, the
user need to get the value by setting 0 to the flag in gpio request,
then release and set GPIOHANDLE_REQUEST_OUTPUT with the value it
get from previous request. It lead to the request twice for setting/
flipping value of gpio.

Suggestion?

Regards

Bamvor


On 31 August 2016 at 17:45,  <bamvor.zhangjian@linaro.org> wrote:
> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
>
> Signed-off-by: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> ---
>  tools/gpio/gpio-hammer.c | 52 ++++++++++--------------------------------------
>  1 file changed, 10 insertions(+), 42 deletions(-)
>
> diff --git a/tools/gpio/gpio-hammer.c b/tools/gpio/gpio-hammer.c
> index 37b3f14..14dd20c 100644
> --- a/tools/gpio/gpio-hammer.c
> +++ b/tools/gpio/gpio-hammer.c
> @@ -23,49 +23,20 @@
>  #include <getopt.h>
>  #include <sys/ioctl.h>
>  #include <linux/gpio.h>
> +#include "gpio-utils.h"
>
>  int hammer_device(const char *device_name, unsigned int *lines, int nlines,
>                   unsigned int loops)
>  {
> -       struct gpiohandle_request req;
>         struct gpiohandle_data data;
> -       char *chrdev_name;
>         char swirr[] = "-\\|/";
> -       int fd;
>         int ret;
>         int i, j;
>         unsigned int iteration = 0;
>
> -       ret = asprintf(&chrdev_name, "/dev/%s", device_name);
> -       if (ret < 0)
> -               return -ENOMEM;
> -
> -       fd = open(chrdev_name, 0);
> -       if (fd == -1) {
> -               ret = -errno;
> -               fprintf(stderr, "Failed to open %s\n", chrdev_name);
> -               goto exit_close_error;
> -       }
> -
> -       /* Request lines as output */
> -       for (i = 0; i < nlines; i++)
> -               req.lineoffsets[i] = lines[i];
> -       req.flags = GPIOHANDLE_REQUEST_OUTPUT; /* Request as output */
> -       strcpy(req.consumer_label, "gpio-hammer");
> -       req.lines = nlines;
> -       ret = ioctl(fd, GPIO_GET_LINEHANDLE_IOCTL, &req);
> -       if (ret == -1) {
> -               ret = -errno;
> -               fprintf(stderr, "Failed to issue GET LINEHANDLE "
> -                       "IOCTL (%d)\n",
> -                       ret);
> -               goto exit_close_error;
> -       }
> -
> -       /* Read initial states */
> -       ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
> -       if (ret == -1) {
> -               ret = -errno;
> +       /* Do not set input or output to avoid change direction or value */
> +       ret = gpio_gets(device_name, lines, nlines, 0, &data);
> +       if (ret < 0) {
>                 fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
>                         "VALUES IOCTL (%d)\n",
>                         ret);
> @@ -92,18 +63,18 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
>                 for (i = 0; i < nlines; i++)
>                         data.values[i] = !data.values[i];
>
> -               ret = ioctl(req.fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, &data);
> -               if (ret == -1) {
> -                       ret = -errno;
> +               ret = gpio_sets(device_name, lines, nlines,
> +                               GPIOHANDLE_REQUEST_OUTPUT, &data);
> +               if (ret < 0) {
>                         fprintf(stderr, "Failed to issue GPIOHANDLE SET LINE "
>                                 "VALUES IOCTL (%d)\n",
>                                 ret);
>                         goto exit_close_error;
>                 }
>                 /* Re-read values to get status */
> -               ret = ioctl(req.fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, &data);
> -               if (ret == -1) {
> -                       ret = -errno;
> +               ret = gpio_gets(device_name, lines, nlines,
> +                               GPIOHANDLE_REQUEST_OUTPUT, &data);
> +               if (ret < 0) {
>                         fprintf(stderr, "Failed to issue GPIOHANDLE GET LINE "
>                                 "VALUES IOCTL (%d)\n",
>                                 ret);
> @@ -132,9 +103,6 @@ int hammer_device(const char *device_name, unsigned int *lines, int nlines,
>         ret = 0;
>
>  exit_close_error:
> -       if (close(fd) == -1)
> -               perror("Failed to close GPIO character device file");
> -       free(chrdev_name);
>         return ret;
>  }
>
> --
> 1.8.4.5
>
