Return-Path: <SRS0=we6F=5B=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76CA1C0044D
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Mar 2020 09:27:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4073B20674
	for <linux-gpio@archiver.kernel.org>; Mon, 16 Mar 2020 09:27:57 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20150623.gappssmtp.com header.i=@baylibre-com.20150623.gappssmtp.com header.b="G9SvvGTa"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730387AbgCPJ15 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 16 Mar 2020 05:27:57 -0400
Received: from mail-qk1-f195.google.com ([209.85.222.195]:33045 "EHLO
        mail-qk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730025AbgCPJ14 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 16 Mar 2020 05:27:56 -0400
Received: by mail-qk1-f195.google.com with SMTP id q17so209420qki.0
        for <linux-gpio@vger.kernel.org>; Mon, 16 Mar 2020 02:27:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=+6KKRggvbK0+NAqhE3WJvvvxBZ3bm45y+mPyerHldIY=;
        b=G9SvvGTaCE7lk6jTYD5LyqgoCgnp6sGRQuxZMcEmtVxq41kQTtxFkAj6fIqf0DjMzz
         op9lTItLw+6v5TQTPH399nhk2kBcFHmhvFRGgMmyRWJd4uj/MIs1bMl3mHC8tiFsHHsj
         jKAvKNXZ/E1AMhG5WaiLMb0ua6fpM/la/00zLl5p6DfWXS0Zw0vdqxGQTz6Wuj7LT3uW
         tZIUAPbqWjNC5ORiu4YZFKOeEXuiaYgavOZXqveBxoT39LhJamV+ZWqE977iffHP6lRp
         tKKzG7mu7O6sKqyxl5cftq5e3BsY5uBsQ4lh6kfZofNxGL1kWyfqhYxeJhFW1KqopRc9
         pRlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=+6KKRggvbK0+NAqhE3WJvvvxBZ3bm45y+mPyerHldIY=;
        b=egIv46om/la3Izu4W0xEYWHk8qzRFDOWrylyuktMdfmG9b6ue8/kLtM0P0xXiwH+Ve
         VhC0ix8TrKo39X91vZyJG2nPbSggeEx/bL/4vYKTXO0EXtnFE6UM+xGoMHV3wbnPIRXM
         JYB0g8D5aWVBCagVNBBHBxBWPLxS8CSzN4xXvti6qaRMcJORU72sWaxLUk134Cr7ycXR
         v73tn4RHbAvD/UQT0UpDQiEChZ8rwvJBGo44Gl3HysEmkwcBZ9DnT92ZdZxq4u3TJ5Qu
         CESh5YlnrHY10jbyIrmKB58SZnERUQkfa9S2qD0U8nJp2PoQzS2R6E7hy3wLHAe1U0Zg
         KohA==
X-Gm-Message-State: ANhLgQ3jo0jZmnT+HmKAd7hDbP8RKAoaYIeabBDLztqJqkdxM19isY+6
        bnBey6LtRw/A/D3TAGrcnj4+K6bzilwCrCPUuxslew==
X-Google-Smtp-Source: ADFU+vtA89e3VaeupVSYxqp/eyk/8w7sDvNnoJ+ZP6HESQ3pGFQfQz4PmtMTNCvvjdPZ3PC77VGAexLRBZQNRVaJkLs=
X-Received: by 2002:a37:4808:: with SMTP id v8mr22591137qka.263.1584350875543;
 Mon, 16 Mar 2020 02:27:55 -0700 (PDT)
MIME-Version: 1.0
References: <20200315121338.251362-1-gch981213@gmail.com> <20200315121338.251362-3-gch981213@gmail.com>
In-Reply-To: <20200315121338.251362-3-gch981213@gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Mon, 16 Mar 2020 10:27:44 +0100
Message-ID: <CAMpxmJXZpJ4D2oPYrkWOXeLzih5ti=YN-TBb6PGzP=4JVhXnOA@mail.gmail.com>
Subject: Re: [PATCH 2/2] gpio: mt7621: add BGPIOF_NO_SET_ON_INPUT flag
To:     Chuanhong Guo <gch981213@gmail.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Sergio Paracuellos <sergio.paracuellos@gmail.com>,
        =?UTF-8?Q?Ren=C3=A9_van_Dorst?= <opensource@vdorst.com>,
        open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

niedz., 15 mar 2020 o 13:14 Chuanhong Guo <gch981213@gmail.com> napisa=C5=
=82(a):
>
> DSET/DCLR registers only works on output pins. Add corresponding
> BGPIOF_NO_SET_ON_INPUT flag to bgpio_init call to fix direction_out
> behavior.
>
> Signed-off-by: Chuanhong Guo <gch981213@gmail.com>

Patch applied with Rene's and Sergio's tags.

Bartosz
