Return-Path: <SRS0=84JL=4J=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 104D5C35656
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Feb 2020 14:45:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id D7BF320656
	for <linux-gpio@archiver.kernel.org>; Fri, 21 Feb 2020 14:45:08 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZmmmuWIi"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728866AbgBUOpI (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 21 Feb 2020 09:45:08 -0500
Received: from mail-lj1-f195.google.com ([209.85.208.195]:35948 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728436AbgBUOpI (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 21 Feb 2020 09:45:08 -0500
Received: by mail-lj1-f195.google.com with SMTP id r19so2454822ljg.3
        for <linux-gpio@vger.kernel.org>; Fri, 21 Feb 2020 06:45:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=D7H0nLZLfPLMvCph5hwyr9duK+xVs3IbYudoH06c9do=;
        b=ZmmmuWIiC4m3STzQoVx5OWjfevcGXgj2dE2igO0Gwa28aZUoG6DI+0TmuYyHUEbKzu
         8Q0GomIcIIjcm+iWqGbPQznhzi51NLQkazdcpPB22p5nEFzNklowRDH1tz98tvinRyus
         JVJctZIvlJKR2qmTy19dI7mojx6df5HmJP2I1xiGALmaOWqG9/NXYRnkKNzlb+/eNaFS
         aJAWXlnWIk2/P+Yl+ejHtRvnAXRAWQjE2DSv3WG8sqjHHXbOq8cUH9Huyux8lvHqOl35
         stzBHXSqZFzKSVtnAvkIrQI8XKHEPQUBEeWlg5dGdsBb5H1IzhSyFkSgI2gmPTo82n+9
         EVmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=D7H0nLZLfPLMvCph5hwyr9duK+xVs3IbYudoH06c9do=;
        b=sCPKtNwkPDfqen+9xJhNP3S6xg07lIjBGt/5FR38gZQvMBJjMpkQDMO+OEdQRRH38D
         DDaTVF219BSg851+NVel3+PQef23ldzcTJeiq5b1DaEn8lY/kTzqrufzKmeBAEh3KVvX
         txCuQKMJcdqE1LQGcbScVmb5etIZhLLpPQRLh83Wx8SqQFJgLG8/9sz7YpH1kX0QqUZf
         1QivpynmSgL7pzVoqTx5Q8JBJjOGsjJTBKidUyuWLkV6b52MwU9Zoj+lq4Ab2kEH8jY5
         wG8SygZq4sAXJifP+o8vTNT+Vzklv8ieinB1bX5MMytUr6OlU5S2TQ8gT06EN4GhNm2y
         slgw==
X-Gm-Message-State: APjAAAUmmg/3nt6PUYMnt3rJOsd5s7wTrxy+ovdldyqabDWNQPeijwsa
        Fk9+WPCncKrhhaE5eA8xg3MI5p1PtCZxdrttxIJ+/w==
X-Google-Smtp-Source: APXvYqyH1op228/uT3a0GVKtys5dZFCvQZ6VFBF+qI9pOeMLciTXqxLF8hf209U+UX9YSS8Q0rsF52Fv3M5LlI7ewKY=
X-Received: by 2002:a2e:9013:: with SMTP id h19mr23015684ljg.223.1582296306067;
 Fri, 21 Feb 2020 06:45:06 -0800 (PST)
MIME-Version: 1.0
References: <1582012300-30260-1-git-send-email-Anson.Huang@nxp.com> <1582012300-30260-3-git-send-email-Anson.Huang@nxp.com>
In-Reply-To: <1582012300-30260-3-git-send-email-Anson.Huang@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 21 Feb 2020 15:44:55 +0100
Message-ID: <CACRpkdaCC5-GWKyeoa8yS9JgHRvW_+AdqTYxy902TC48pMzXdg@mail.gmail.com>
Subject: Re: [PATCH V4 3/4] dt-bindings: pinctrl: Convert i.MX8MN to json-schema
To:     Anson Huang <Anson.Huang@nxp.com>
Cc:     Dong Aisheng <aisheng.dong@nxp.com>,
        Fabio Estevam <festevam@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Stefan Agner <stefan@agner.ch>,
        Sascha Hauer <kernel@pengutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        NXP Linux Team <Linux-imx@nxp.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 18, 2020 at 8:57 AM Anson Huang <Anson.Huang@nxp.com> wrote:

> Convert the i.MX8MN pinctrl binding to DT schema format using json-schema
>
> Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
> ---
> Changes since V3:
>         - use uint32-matrix instead of uint32-array for fsl,pins.

Patch applied with Rob's Review tag.

Yours,
Linus Walleij
