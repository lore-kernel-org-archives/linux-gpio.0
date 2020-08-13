Return-Path: <SRS0=NG6A=BX=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D436EC433E1
	for <linux-gpio@archiver.kernel.org>; Thu, 13 Aug 2020 18:39:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B49B92078B
	for <linux-gpio@archiver.kernel.org>; Thu, 13 Aug 2020 18:39:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20150623.gappssmtp.com header.i=@bgdev-pl.20150623.gappssmtp.com header.b="UvUaV/i2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgHMSjX (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 13 Aug 2020 14:39:23 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52694 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726167AbgHMSjW (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 13 Aug 2020 14:39:22 -0400
Received: from mail-il1-x144.google.com (mail-il1-x144.google.com [IPv6:2607:f8b0:4864:20::144])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE5AAC061757
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 11:39:22 -0700 (PDT)
Received: by mail-il1-x144.google.com with SMTP id t4so6414082iln.1
        for <linux-gpio@vger.kernel.org>; Thu, 13 Aug 2020 11:39:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=0dxllXz3eewzWwiGomIms9j7OBqGXS9TB5I7fzH5wS0=;
        b=UvUaV/i2OzFnkRinct+vbHczmBAtUtxoy0Th55wVhi4Yg1Ts0G3Lcs83yQ3x6qlI3G
         AZJZARR8fU25p6fC8ZMk+irJH/xUnHIUvVcMvESKy/iSH8j5nTjvWHOkpY1rQCTzqpqB
         odbRbwrd4uCY6rXPTy8Z69NDPGxXObfXAawsRJnDzIWNiYQBd/fjLB/tK5E3sBxLq1mv
         oBNRLLgdKVKUeBi+PubgvPP+YY+wxepe9Rlt4XIfJwZMVpZcM6SVMyosH6j91XIrUmlc
         QNNWiB5TVenC3lqVrmgmmq5WjKfiub7lyGS43hrDI4Ghc1mq270rHvU0djGeTVRMXaW9
         nwow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=0dxllXz3eewzWwiGomIms9j7OBqGXS9TB5I7fzH5wS0=;
        b=BVjd4NEyeNreCux52pjl96NeJtLXMbSXSpRD902y/sS/R0X2a0qq69jw3hu5iHzrBo
         4kACDAh+2qHr7981x2zr+TFY1j6ShxE6rtO/yvVMJzDc4L+W9RX0AapA5K7sLxuUfFh0
         VuvQd5R2Orc4y5vXiQoff0JIQQ8PTc8nvVwKGZ0XSW0KwXF8jU+4KejgU4gtj6CzXL1F
         C9Bfbh4Fovoef3hRNyuqFwxX7mbGO2xP5MDMxycsxUbrp98d7Y8ckiHShDo3ojyJERdk
         ma05majfVKiQIt4tokfJMmB6fOyeoja07/NejH9Q2q+4nCxhQs8p1xL0Up7gAYhP6ToM
         qGgg==
X-Gm-Message-State: AOAM533eMr7iUbl1iltv5sOutJpoBktCzpWTJ3hXVrDMzrouBUpuO18y
        Ru6/nClrD2nJATRCJ4y7SQTFcV9Rwtd8DGGfP//0hg==
X-Google-Smtp-Source: ABdhPJxSN79SGtxqX3pyDy4sdSp8M3TF3tvGEQaB0t1RocyOuQrzGzBb3jupWm0ThH8cJleYA4LOM/LAZVOVTi0jF7U=
X-Received: by 2002:a05:6e02:d86:: with SMTP id i6mr6258187ilj.6.1597343962220;
 Thu, 13 Aug 2020 11:39:22 -0700 (PDT)
MIME-Version: 1.0
References: <20200808095944.188479-1-alexander.stein@mailbox.org> <20200808095944.188479-3-alexander.stein@mailbox.org>
In-Reply-To: <20200808095944.188479-3-alexander.stein@mailbox.org>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Thu, 13 Aug 2020 20:39:11 +0200
Message-ID: <CAMRc=MfK3WvD8dmBDa6=v3B=8ZjR6Pae_Zn952E4L8uNHeqr4A@mail.gmail.com>
Subject: Re: [libgpiod] [PATCH 2/5] doc: Use autotoolized Doxyfile
To:     Alexander Stein <alexander.stein@mailbox.org>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Aug 8, 2020 at 12:00 PM Alexander Stein
<alexander.stein@mailbox.org> wrote:
>
> This has several advantages:
> * More simplified Makefile.am
> * Actually used doxygen config is available as a file
> * Building doc out-of-tree is possible
>
> Signed-off-by: Alexander Stein <alexander.stein@mailbox.org>
> ---
>  .gitignore              | 1 +
>  Doxyfile => Doxyfile.in | 3 ++-
>  Makefile.am             | 4 +---
>  configure.ac            | 1 +
>  4 files changed, 5 insertions(+), 4 deletions(-)
>  rename Doxyfile => Doxyfile.in (95%)
>
> diff --git a/.gitignore b/.gitignore
> index 488d9d6..a77efde 100644
> --- a/.gitignore
> +++ b/.gitignore
> @@ -10,6 +10,7 @@ doc
>  # autotools stuff
>  .deps/
>  .libs/
> +Doxyfile
>  Makefile
>  Makefile.in
>  aclocal.m4
> diff --git a/Doxyfile b/Doxyfile.in
> similarity index 95%
> rename from Doxyfile
> rename to Doxyfile.in
> index b194095..8c6d591 100644
> --- a/Doxyfile
> +++ b/Doxyfile.in
> @@ -10,6 +10,7 @@
>
>  # General configuration
>  PROJECT_NAME           = libgpiod
> +PROJECT_NUMBER         = @VERSION_STR@
>  OUTPUT_DIRECTORY       = doc
>  OUTPUT_LANGUAGE        = English
>  EXTRACT_ALL            = NO
> @@ -48,7 +49,7 @@ WARNINGS               = YES
>  WARN_IF_UNDOCUMENTED   = YES
>  WARN_FORMAT            =
>  WARN_LOGFILE           =
> -INPUT                  = include/gpiod.h
> +INPUT                  = @top_srcdir@/include/gpiod.h @top_srcdir@/bindings/cxx/gpiod.hpp
>  SOURCE_BROWSER         = YES
>  INLINE_SOURCES         = NO
>  REFERENCED_BY_RELATION = YES
> diff --git a/Makefile.am b/Makefile.am
> index d3f57b2..72e6a25 100644
> --- a/Makefile.am
> +++ b/Makefile.am
> @@ -29,9 +29,7 @@ SUBDIRS += bindings
>  if HAS_DOXYGEN
>
>  doc:
> -       @(cat Doxyfile; \
> -               echo PROJECT_NUMBER = $(VERSION_STR); \
> -               echo INPUT += bindings/cxx/gpiod.hpp) | doxygen -
> +       @doxygen Doxyfile

This needs a dependency on Doxyfile in the Makefile or it won't work
if the generated Doxyfile is removed after .configure. I'll fix it in
the tree.

Bart

>  .PHONY: doc
>
>  clean-local:
> diff --git a/configure.ac b/configure.ac
> index 008499d..c2d9f99 100644
> --- a/configure.ac
> +++ b/configure.ac
> @@ -207,6 +207,7 @@ if test "x$has_doxygen" = xfalse
>  then
>         AC_MSG_NOTICE([doxygen not found - documentation cannot be generated])
>  fi
> +AM_COND_IF([HAS_DOXYGEN], [AC_CONFIG_FILES([Doxyfile])])
>
>  if test "x$cross_compiling" = xno
>  then
> --
> 2.28.0
>
