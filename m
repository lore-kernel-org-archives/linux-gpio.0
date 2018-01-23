From: Bartosz Golaszewski <brgl@bgdev.pl>
Subject: Re: [PATCH] [libgpiod] gpiomon: initialize the active low variable
Date: Tue, 23 Jan 2018 11:20:10 +0100
Message-ID: <CAMRc=McdAjaVkiTGj1kTQZPhHiSvcfPGJHBwmRtsu9RbdDok_w@mail.gmail.com>
References: <20180122161213.3076-1-clemens.gruber@pqgruber.com> <20180122161213.3076-2-clemens.gruber@pqgruber.com>
Mime-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:46660 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751233AbeAWKUL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 23 Jan 2018 05:20:11 -0500
Received: by mail-ot0-f196.google.com with SMTP id t35so10190321otd.13
        for <linux-gpio@vger.kernel.org>; Tue, 23 Jan 2018 02:20:11 -0800 (PST)
In-Reply-To: <20180122161213.3076-2-clemens.gruber@pqgruber.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-gpio@vger.kernel.org

2018-01-22 17:12 GMT+01:00 Clemens Gruber <clemens.gruber@pqgruber.com>:
> The variable active_low is not initialized, so the value is undefined
> and if the -l argument is not passed, the undefined value remains.
> Fix it by initializing it to false.
>
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> ---
>  src/tools/gpiomon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/src/tools/gpiomon.c b/src/tools/gpiomon.c
> index ad25815..5e68a4f 100644
> --- a/src/tools/gpiomon.c
> +++ b/src/tools/gpiomon.c
> @@ -249,9 +249,9 @@ int main(int argc, char **argv)
>         unsigned int offsets[GPIOD_LINE_BULK_MAX_LINES];
>         struct timespec timeout = { 10, 0 };
>         unsigned int num_lines = 0, offset;
> +       bool active_low = false;
>         int optc, opti, ret, i;
>         struct mon_ctx ctx;
> -       bool active_low;
>         char *end;
>
>         memset(&ctx, 0, sizeof(ctx));
> --
> 2.16.0
>

Applied, thanks!
