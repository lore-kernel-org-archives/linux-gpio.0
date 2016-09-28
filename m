From: Michael Welling <mwelling@ieee.org>
Subject: Re: [PATCH v3 1/5] tools/gpio: add gpio basic opereations
Date: Wed, 28 Sep 2016 17:12:25 -0500
Message-ID: <20160928221225.zeyhnz77wfve2l4i@qwertyuiop>
References: <20160831094548.12574-1-bamvor.zhangjian@linaro.org>
 <20160831094548.12574-2-bamvor.zhangjian@linaro.org>
 <20160928191642.hqfkmfafy7l3ss2b@qwertyuiop>
 <CAFy1USS_HSF14R_V+90kg87a6THnVT9De8Tbz4DS+ZLbux7=WQ@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33416 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753890AbcI1WMe (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 28 Sep 2016 18:12:34 -0400
Received: by mail-pf0-f194.google.com with SMTP id q2so2640320pfj.0
        for <linux-gpio@vger.kernel.org>; Wed, 28 Sep 2016 15:12:34 -0700 (PDT)
Content-Disposition: inline
In-Reply-To: <CAFy1USS_HSF14R_V+90kg87a6THnVT9De8Tbz4DS+ZLbux7=WQ@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Bamvor Zhang Jian <bamvor.zhangjian@linaro.org>
Cc: linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Mark Brown <broonie@kernel.org>

On Wed, Sep 28, 2016 at 02:35:17PM -0700, Bamvor Zhang Jian wrote:
> Hi, Michael
> 
> On 28 September 2016 at 12:16, Michael Welling <mwelling@ieee.org> wrote:
> > On Wed, Aug 31, 2016 at 11:45:44AM +0200, bamvor.zhangjian@linaro.org wrote:
> >> From: Bamvor Jian Zhang <bamvor.zhangjian@linaro.org>
> [...]
> >> +     ret = ioctl(fd, GPIOHANDLE_SET_LINE_VALUES_IOCTL, data);
> >> +     if (ret == -1) {
> >> +             ret = -errno;
> >> +             fprintf(stderr, "Failed to issue %s (%d)\n",
> >> +                     "GPIOHANDLE_SET_LINE_VALUES_IOCTL", ret);
> >> +             goto exit_close_error;
> >
> > This goto is unnecessary because there is no code to be skipped.
> >
> >> +     }
> >> +
> >> +exit_close_error:
> >> +     return ret;
> >> +}
> >> +
> >> +int gpio_get_values(const int fd, struct gpiohandle_data *data)
> >> +{
> >> +     int ret;
> >> +
> >> +     ret = ioctl(fd, GPIOHANDLE_GET_LINE_VALUES_IOCTL, data);
> >> +     if (ret == -1) {
> >> +             ret = -errno;
> >> +             fprintf(stderr, "Failed to issue %s (%d)\n",
> >> +                     "GPIOHANDLE_GET_LINE_VALUES_IOCTL", ret);
> >> +             goto exit_close_error;
> >
> > Same here.
> Thanks. I will fix above two in next version.
> >
> >> +     }
> >> +
> >> +exit_close_error:
> >> +     return ret;
> >> +}
> >> +
> >> +int gpio_release(const int fd)
> >> +{
> >> +     int ret;
> >> +
> >> +     ret = close(fd);
> >> +     if (ret < -1)
> >> +             perror("Failed to close GPIO LINEHANDLE device file");
> >> +
> >> +     return ret;
> >> +}
> >> +
> >> +int gpio_gets(const char *device_name, unsigned int *lines, unsigned int nlines,
> >> +           unsigned int flag, struct gpiohandle_data *data)
> >> +{
> >> +     int fd;
> >> +     int ret;
> >> +
> >> +     ret = gpio_request(device_name, lines, nlines, flag, data, COMSUMER);
> >> +     if (ret < 0)
> >> +             return ret;
> >> +
> >> +     fd = ret;
> >> +     ret = gpio_get_values(fd, data);
> >
> > The error checking is missing here.
> Well, no matter the gpio_get_values fails or not. We both need to release the
> line we request. But, we need the return value if gpio_get_values fails. In the
> next version, I will return the errno of gpio_get_values if it fails.
> >
> >> +     ret = gpio_release(fd);
> >
> > Shouldn't we leave it up the user how they want the deal with the file handle?
> > There is more system call overhead if we open and close the GPIO device for
> > each access.
> Yes. I understand and agree the syscall overhead you mentioned. So, I provide
> the request, ops, release ops above. These gpio_[sg]ets? functions is the easy
> way if the user only access the gpio in a few times.
> >
> >> +     return ret;
> >> +}
> >> +
> >> +int gpio_sets(const char *device_name, unsigned int *lines, unsigned int nlines,
> >> +           unsigned int flag, struct gpiohandle_data *data)
> >> +{
> >> +     int ret;
> >> +
> >> +     ret = gpio_request(device_name, lines, nlines, flag, data, COMSUMER);
> >> +     if (ret < 0)
> >> +             return ret;
> >> +
> >> +     ret = gpio_release(ret);
> >> +     return ret;
> >> +}
> >> +
> >> +int gpio_get(const char *device_name, unsigned int line, unsigned int flag)
> >> +{
> >> +     struct gpiohandle_data data;
> >> +     unsigned int lines[] = {line};
> >
> > Is the lines variable really needed?
> Do you mean something like gpio_gets(device_name, {line}, 1, flag, &data);?
> Personally, I like the first version. Because it is more clear and compiler
> will optimize it anyway. Ideas?

gpio_gets(device_name, &line, 1, flag, &data);

It may be easier to understand the way you have it.

> 
> Regards
> 
> Bamvor
