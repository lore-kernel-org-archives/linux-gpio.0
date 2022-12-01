Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE1CAC43217
	for <linux-gpio@archiver.kernel.org>; Thu,  1 Dec 2022 14:21:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231806AbiLAOVY (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 1 Dec 2022 09:21:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36556 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231830AbiLAOVX (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 1 Dec 2022 09:21:23 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 22B7DAFCE1
        for <linux-gpio@vger.kernel.org>; Thu,  1 Dec 2022 06:21:21 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id g12so2733113lfh.3
        for <linux-gpio@vger.kernel.org>; Thu, 01 Dec 2022 06:21:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=n1YbJ7GxHRoJTWKCcpMV5cChgDKSibhJGs2SkuVSM8k=;
        b=MjxOApHUka4IJMZj8cmJSvql8lGIvwK4nFkwXkulNvtSe4XyGNPhy+9u/4N3STKJHf
         j/iZvUPvnSMJ3mQ2K3Lw3KqyVL6QR316RESQjKyU6v5pQHkwYX7LEHAJ0j/Z5jSAgd1y
         XE+0w25O5MiOJ6gmFIHctdZzalR3Z2Rdgo5RuTFDFrx8RrDz1W9NrJNpc02edoy9APDv
         4gMkxfyz+UEmBsNAHnZO16Ymzx3icW72a6xdwvRUAF+05mb6MfIZ8JKIWLe17rW2ueoB
         1fAW7cPvg2HJUQo5u0FRfaZaoPE/9oDZcwU75weaNyuHvJr5b/LsqG958h56iVUcMkEq
         mphA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n1YbJ7GxHRoJTWKCcpMV5cChgDKSibhJGs2SkuVSM8k=;
        b=tzJ1yQ7RdlzopNvuhOuLV5obLq61RBv6dT2fxzjawKhEjdpI67+XS8hCnXMYg2cV+W
         w379wZDWkEQNr5O8SpOKlr/KNcEWk0NWMkckTRIDPwGSKBmoLfzMw6vvzL2HXRV6JhDt
         pz67jiqzf0PVG5ih+9MEJVKoiaBAgQn6POOOnkH4uFIyQ/e4jkoYkZDXod/Wt6k8gbcN
         gPucWuC47qiI/a40bRc3C5mtWfQ+TZKbqB9jh+ejmBkRfKjLyGNn4Y2MmwUSMlX/55/5
         fcdXAx7nZtC7pEYprAA7RBsVgA6fJwpZpDCp71cwCA9PowlVm3ZeWDG6osjehuaCCrvY
         MTLQ==
X-Gm-Message-State: ANoB5pnCwKn1q8DYukM5KF/oes9PjAHWVyB3ybHCjsgsKGQyhj+dn3yp
        E7CEyeAz58HGB3rq+lEsf31H8R6B9cKkbpdmTHmvvg70knA=
X-Google-Smtp-Source: AA0mqf7mY+DtzAlbgKFScEuvxuoYcE0KqlD1q/lIIykbQmfxluUHBx3EJRcalzKN3QH6IvZjTZ6Lzm02DSt5tb4Ogvc=
X-Received: by 2002:ac2:43d8:0:b0:4a2:45ce:a169 with SMTP id
 u24-20020ac243d8000000b004a245cea169mr23508788lfl.51.1669904479417; Thu, 01
 Dec 2022 06:21:19 -0800 (PST)
MIME-Version: 1.0
References: <20221130124231.1054001-1-brgl@bgdev.pl> <20221130124231.1054001-3-brgl@bgdev.pl>
 <Y4dhu0rgNoyvR7cf@smile.fi.intel.com>
In-Reply-To: <Y4dhu0rgNoyvR7cf@smile.fi.intel.com>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 1 Dec 2022 15:21:07 +0100
Message-ID: <CAMRc=McdumwogXRFn6rMf8u4W0eSP=gTbp2WcB4oekPRgMSM_w@mail.gmail.com>
Subject: Re: [libgpiod][PATCH 02/11] treewide: apply formatting changes with clang-format
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Kent Gibson <warthog618@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Nov 30, 2022 at 2:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> On Wed, Nov 30, 2022 at 01:42:22PM +0100, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > Use linux kernel's .clang-format file to automatically improve the coding
> > style of libgpiod's C code base. We don't import the file into the
> > repository as it's not perfect and certain converted fragments were
> > rolled back because they looked better before the conversion.
>
> ...
>
> >               if (gpiod_line_settings_get_direction(
> > -                             per_line->node->settings) !=
> > +                         per_line->node->settings) !=
> >                   GPIOD_LINE_DIRECTION_OUTPUT)
> >                       continue;
>
> Personally I percept this as an ugly indented code...
>
> One reason is too strict 80 or whatever rule (we are almost in
> the second quarter of the 21st century!), another is that trailing
> opening parenthesis.

This is very much a question of personal preference and as the
maintainer I get to pick and choose the coding style for the project
but let me provide a personal argument in favor of the 80 line limit.
I mostly work with C and use a single big screen for work. When the
limit is set to 80 chars (or 88 which is standard for python), I get
to have four columns of code on my screen and still work comfortably.
Unless it really adds to the readability, I prefer to keep it.

Bart

>
> That said, some of the changes in this patch I like, some I disgust.
> Quite controversial to me, but it's your project and esp. taking into
> account that it's a user space, the kernel or other project rules are
> not applicable in a general sense anyway.
>
> --
> With Best Regards,
> Andy Shevchenko
>
>
