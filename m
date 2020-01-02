Return-Path: <SRS0=00tE=2X=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75BA0C2D0C2
	for <linux-gpio@archiver.kernel.org>; Thu,  2 Jan 2020 17:41:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3E7D92072C
	for <linux-gpio@archiver.kernel.org>; Thu,  2 Jan 2020 17:41:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="e75wHxGn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727830AbgABRlw (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 2 Jan 2020 12:41:52 -0500
Received: from mail-qv1-f66.google.com ([209.85.219.66]:35513 "EHLO
        mail-qv1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727755AbgABRlw (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 2 Jan 2020 12:41:52 -0500
Received: by mail-qv1-f66.google.com with SMTP id u10so15202016qvi.2
        for <linux-gpio@vger.kernel.org>; Thu, 02 Jan 2020 09:41:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=IKwnMz4e63VKZilbDOGb2I7aKNEn21Vd5Ru0YbiCZDI=;
        b=e75wHxGnbpPFzBqIDLFaZvH714OeRG+U8IBZte2LJuCehmSyARdnQF54xugAKU4SyQ
         n6dl4Pvds2zhSFknt+DREXQWDm2iQ20pTvhWue87dz+dTdJfyuR8eNRjixxkLtjSkleU
         bPQ3wpolp+00qLYIAaX/oVh2X7izaAMqoCtuw9RM2qZMdJL0QPAX6hD+bI9SrzKvwwpE
         gAOkAsQ9id32uxuTsgdl7N/cn3HDYiDLfd69bpgYIYOgLbYnBI0OPELXC8CrJzP9CKuR
         9Jjc9cu38mo4WmZqc/iEfs0fLAjm6wDq75qz0IwjK1ciUmTsEl6Z5YxvOEuxeDl6FkRZ
         dQ2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=IKwnMz4e63VKZilbDOGb2I7aKNEn21Vd5Ru0YbiCZDI=;
        b=eEnbiM4hjbwPA7F8ksPaOVg6XHoEAob3loN6GWo7/StkDVjT1GVq92D5Kd7NXUkGjt
         uCQ4kpo4OuO+NdomnYkJh/is1iBeIyPiuf/KFXCkWavKqNip0Jg9Eb+3ieb+5VKYF0f3
         jYFTkXeKEl2lwJigohF3T65mUXSSHEP5cx/JWdjIeOPPeRHnGxZPsRN0FSuc8TKIqn3l
         E3JVxZ8ZigqETwGy1BLHZ9WcXbeCYEkg0g7jRplmtO9/AaPEnuSXJkjMCeaiefNVTLtc
         Gyhl4jTEFwgq4mI/gV20iddFrhl/uHhqIBdOTF3uTkSQ89U7ppn6atDIDO0IhKWbuLS3
         spWQ==
X-Gm-Message-State: APjAAAUcDWNiSprSKMY0R//VCJ7B3XtZqDqUj40i0hcWMA4N9IFryief
        bliz4SHON6rF1DSDwY8AK0Bd1CaroJnUTHY5gifkuA==
X-Google-Smtp-Source: APXvYqwO8doe54/rCFcY5tcQfFh/7vJk0PPh/rrnHgc+GTFet+8pm81kW3bXrD/CFwELjeDhBVn8ZH/v9IlDESq+ldc=
X-Received: by 2002:a05:6214:923:: with SMTP id dk3mr61936227qvb.96.1577986911821;
 Thu, 02 Jan 2020 09:41:51 -0800 (PST)
MIME-Version: 1.0
References: <1577362338-28744-1-git-send-email-srinivas.neeli@xilinx.com> <1577362338-28744-6-git-send-email-srinivas.neeli@xilinx.com>
In-Reply-To: <1577362338-28744-6-git-send-email-srinivas.neeli@xilinx.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Thu, 2 Jan 2020 18:41:40 +0100
Message-ID: <CAMpxmJVbWY_ZRvyrRW9xrV152vezHg-ZES660PCaJQrW5Zs_-g@mail.gmail.com>
Subject: Re: [PATCH 5/8] gpio: zynq: Add Versal support
To:     Srinivas Neeli <srinivas.neeli@xilinx.com>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Michal Simek <michal.simek@xilinx.com>,
        shubhrajyoti.datta@xilinx.com,
        linux-gpio <linux-gpio@vger.kernel.org>,
        arm-soc <linux-arm-kernel@lists.infradead.org>,
        LKML <linux-kernel@vger.kernel.org>, git@xilinx.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

czw., 26 gru 2019 o 13:12 Srinivas Neeli <srinivas.neeli@xilinx.com> napisa=
=C5=82(a):
>
> From: Shubhrajyoti Datta <shubhrajyoti.datta@xilinx.com>
>
> Add Versal support in gpio.

Please, provide some background in the commit message. I have no idea
what Versal is.

Bart
