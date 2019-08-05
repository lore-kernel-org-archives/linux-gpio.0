Return-Path: <SRS0=WyK8=WB=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDDEC433FF
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 11:26:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4483320679
	for <linux-gpio@archiver.kernel.org>; Mon,  5 Aug 2019 11:26:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="qIT1QTF1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727349AbfHEL0j (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 5 Aug 2019 07:26:39 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35043 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727328AbfHEL0j (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 5 Aug 2019 07:26:39 -0400
Received: by mail-lj1-f195.google.com with SMTP id x25so79059822ljh.2
        for <linux-gpio@vger.kernel.org>; Mon, 05 Aug 2019 04:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jIRa3TvqiJWaXbGz1Sxgf45N57AQXqRegz7cACuc68A=;
        b=qIT1QTF1w0efi6+3yipuwFrYZL30qqHrYgmctXv8UnneOjx2GgF+0JZtmxWgB1Mg8/
         v+7dHYiNP7xfVA03cjMy3k9BEgBXLsYVymjoWiHzr3/5VNRBifxMEd4ZWVsXOKaAmTrB
         CcSQROuJEp6EE32Z1GgjQVsmuRDRbtCDceXuYg38GWcy27+AnKpv+kH4QLXoTIvYUobH
         dGpTPrusQ7v5U3BtBFHERMkYU90cXbkQJxsIMDQup9UDjnWGH5+uV4f6ygLlQHWhCnGm
         rMuIko9zudS/9WkGNeZXicg8j4Tw5FD2bvF67egZMkd3SiZN3d2Veb/HAxmtWny9+eXo
         O75Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jIRa3TvqiJWaXbGz1Sxgf45N57AQXqRegz7cACuc68A=;
        b=l5PwO7798HcMCe1Z/AsOe+kmpdPGWrMVqa0z/xBSTChHxFbeaO75gf2WnV002l6yCS
         K/m0yycIRq4mPZdJmA1BnDlHgyxpBCOK8r4NLKM0J9MnY2v4jOoy5j6zuqKP95lY7UWN
         CZnVuJoQBvdx7Oy4rMEAayw6e7233VmN8JERdFJ4kHTJbNrEXgqztHplLq2B2rXp1N2r
         fqHMGkVcsP0RVoFmP4wpU25vTDVu2Qf9xTcwbmfaJmVF1d60itk4KTHHpzON0XZvfj1u
         HVUdASmVRfqBSgUdTVS5ssRVGVfiYq0tJ6ztapP4noNPB9DQMCJSc8JnQvtGTOI7iElg
         C1jQ==
X-Gm-Message-State: APjAAAXF8A2dHsgU5FWRMveYsA5BYCfPRexWj1/3ZgMVWpkXSged9Elo
        HeTwb5Tqv6vEJCtnhMvtyceRbJG8NW79/Gn2jzUHAnVC
X-Google-Smtp-Source: APXvYqwwzZUZzBlGj7UKPIgPKL/x6U8mlX5D2rx/vEhK1wdbSnO0UQNpPepk9N43zQqnbiwujFLC3RSHRZ8fPZyvLzM=
X-Received: by 2002:a2e:9048:: with SMTP id n8mr62373ljg.37.1565004397519;
 Mon, 05 Aug 2019 04:26:37 -0700 (PDT)
MIME-Version: 1.0
References: <20190730181557.90391-1-swboyd@chromium.org> <20190730181557.90391-16-swboyd@chromium.org>
In-Reply-To: <20190730181557.90391-16-swboyd@chromium.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 5 Aug 2019 13:26:25 +0200
Message-ID: <CACRpkdbJ0dLpLyHMLkzaKDtPdR-JGaj30QQJCDTSh61qXRX6JQ@mail.gmail.com>
Subject: Re: [PATCH v6 15/57] gpio: Remove dev_err() usage after platform_get_irq()
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Jul 30, 2019 at 8:16 PM Stephen Boyd <swboyd@chromium.org> wrote:

> We don't need dev_err() messages when platform_get_irq() fails now that
> platform_get_irq() prints an error message itself when something goes
> wrong. Let's remove these prints with a simple semantic patch.
(...)
> While we're here, remove braces on if statements that only have one
> statement (manually).
>
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>
> Cc: linux-gpio@vger.kernel.org
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>

Patch applied!

Yours,
Linus Walleij
