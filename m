Return-Path: <SRS0=MUnz=5K=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DA8EC43331
	for <linux-gpio@archiver.kernel.org>; Wed, 25 Mar 2020 11:11:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6295B20714
	for <linux-gpio@archiver.kernel.org>; Wed, 25 Mar 2020 11:11:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="UuPj63yS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726313AbgCYLLr (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 25 Mar 2020 07:11:47 -0400
Received: from mail-lf1-f51.google.com ([209.85.167.51]:46653 "EHLO
        mail-lf1-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726043AbgCYLLq (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 25 Mar 2020 07:11:46 -0400
Received: by mail-lf1-f51.google.com with SMTP id q5so1382587lfb.13
        for <linux-gpio@vger.kernel.org>; Wed, 25 Mar 2020 04:11:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6bJq3v/9nacx1zEmtv5VjMo6BZRGtaXxe6iCb/9jCso=;
        b=UuPj63ySEmXmKwZb443ur6B/8BglL6KWi61X9BFxHI6tw/6OXPce5pGYjHH97nw1rd
         6a3RxChkrfoQxtyzfVxr2lyWeKKBLid8TG7aLKMNomFK/O1quV9hAnBara37BWMqK+E2
         EkFeIFCdrm/hd4Mz0Zv+dVKDq2yIJaPvt4gP+A+cKExosYI0Gve/wGwwLEXuamNsrps/
         BoXjQiOVbq5SfTd3XdA6Ibs1NKNEi0ytdAjl1Un8h8U5A0/TYHYh3570fWpnpqc9Ea4o
         5Gh/ds+jhr0nu2B+u1tI85Glc0+LSz4hGdyIZjmCKC0Ak3iVDjvBf+3eVgh+siLMUhcq
         KP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6bJq3v/9nacx1zEmtv5VjMo6BZRGtaXxe6iCb/9jCso=;
        b=Mjq1Eym3rZUmpVLh9ZpTcrCuQqbRw9poPC02bLDNDBO5GxPFEQtXyR/fV7Bk9u/nqD
         jiuLDJDIQFP3w1k5bIfzy2d6q0JXm04QuWl74v8Ip5zy/Zf9k8Ork8j6NaIqaRNxCt5i
         XfHDDaXbvgrqlitE3+pbUlHzRxcko15aA0s/3JeOHYheLjQz0G9HyUX86lhYbogIQQ1L
         Qc+rTgtp6jtcHYiXZ4tf7Go+sA5G8eIBvDLT06H6CIoFCkVcNTUCcBjAFlmWk5DXode3
         ImuNEIFNBju7TWLh7OFwFaYEPgdZUujPo3OdN6+YIgrdjyEyzFhTCj+rT8sJlAx1Cd2/
         sf/Q==
X-Gm-Message-State: ANhLgQ1Aqb/F384Sc1XbPQ3e3VGn4gcGvlRZUCJEvUyRKsRHVaSynOvQ
        Qa5RLkBbEOk1p2eGrx1jq/zP+hXy4tVjA+nUOEI7sg==
X-Google-Smtp-Source: ADFU+vu6riXoCg8h53iBNfJEK63OkgN2gk+c+y6wIqCLF2KX9AgJgH+1oe+5m8jAvq8zk7JFeeSQ+AV90gJxAPRnEJQ=
X-Received: by 2002:ac2:5f7c:: with SMTP id c28mr1901116lfc.4.1585134704921;
 Wed, 25 Mar 2020 04:11:44 -0700 (PDT)
MIME-Version: 1.0
References: <20200325090503.1468-1-brgl@bgdev.pl>
In-Reply-To: <20200325090503.1468-1-brgl@bgdev.pl>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 25 Mar 2020 12:11:33 +0100
Message-ID: <CACRpkdaNNFaEX912YWiV2Yq7H3VcT4ryDusVEA3Z5NUbx_9OFQ@mail.gmail.com>
Subject: Re: [GIT PULL] gpio: updates for v5.7 part4
To:     Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 25, 2020 at 10:05 AM Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> as discussed - this PR contains the same commits as part3 but rebased
> on top of your devel branch.

Thanks!

Pulled in to my devel branch.

Yours,
Linus Walleij
