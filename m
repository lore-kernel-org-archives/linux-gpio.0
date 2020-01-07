Return-Path: <SRS0=ahNV=24=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64AE7C33C99
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Jan 2020 10:44:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 29BCB2081E
	for <linux-gpio@archiver.kernel.org>; Tue,  7 Jan 2020 10:44:40 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DllIUpp1"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727876AbgAGKoj (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 7 Jan 2020 05:44:39 -0500
Received: from mail-lf1-f68.google.com ([209.85.167.68]:44559 "EHLO
        mail-lf1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727763AbgAGKoj (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 7 Jan 2020 05:44:39 -0500
Received: by mail-lf1-f68.google.com with SMTP id v201so38479238lfa.11
        for <linux-gpio@vger.kernel.org>; Tue, 07 Jan 2020 02:44:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RgFKZhJDfhjP3daFjJ6Yf6/c2a34ejzl3DxxsqYxSK4=;
        b=DllIUpp1Q6kXzivnO5X2buqDRRTX00jpFdjqNjevqokIijabbCuM9jomITXwHgjUof
         /+C195g6oInaXzgI+yid4TLVNxbPEuZlRYhPe+ociG+hHlLhNAYn3DtW88rHCxRkQVHZ
         zcH0zmtcTQlBCzt2YYQnpM0U3occFF39huSzirUhJ0eu/cxxQvobisdH6TZN401xKwp5
         cBHAjYyOoHG9zIC1fRyJCsBEoS8Tc96J2WHE7WUnrQA7BHqXaMk7iC8+5kqAkmReWSCa
         v0peScJcrLidcsLRn1+e6r4ETxrH0OCOvIbWEtZliknbhUC41peP2xZphiLk+3Axrg3b
         HvZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RgFKZhJDfhjP3daFjJ6Yf6/c2a34ejzl3DxxsqYxSK4=;
        b=WmaB2evbLVI8V0o/Za3jFLRsma7dEnSehkDVSu+eeSNjssplSiicw/lYbXwuG4t4hy
         rhBJCSaPJ7Kk6n0rII2fygYsifF9/pNHj6buagNV4R1gAQgUf11SdGeFOJc7PuFh0Psl
         9/3lWGxp8Yarjv6t0macEiHvVWkj/X2nDIN2x8uh19kIoKYQVP6on5JdL3ryeF8gU84q
         tmlVUFs3B1QpDGCnStNvCGZrHKI6/l4UGmYst/XrLCEJ2Y7EkCpJriploRXPLcolwk6E
         BaVwQ/ncNJ9rCBkWkbsTM/EyIz2gHZ9NoXwkvdcX+f05hLUe69A4US7HY0Nc2Rjs07CU
         xcdA==
X-Gm-Message-State: APjAAAV2z4nVyllgSELk4T8a0PmxQCCMgoyRQc3Nrey3t17ujDoKsJFg
        bNYIGAt0u3683nY1ztyvZQRKu3+cbAXlL9Q+YpmiKA==
X-Google-Smtp-Source: APXvYqwCT73xBkNQ+g3rH+LQGftKRSrUx+BJ1w6jdMAWsxD0kcF9OCy3oy4cYwg0gSxNlboPKwLt9C01SWBHwRa7UkI=
X-Received: by 2002:ac2:55a8:: with SMTP id y8mr58604010lfg.117.1578393877863;
 Tue, 07 Jan 2020 02:44:37 -0800 (PST)
MIME-Version: 1.0
References: <1577864614-5543-1-git-send-email-Julia.Lawall@inria.fr> <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
In-Reply-To: <1577864614-5543-15-git-send-email-Julia.Lawall@inria.fr>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 7 Jan 2020 11:44:27 +0100
Message-ID: <CACRpkdackV3fDDr4SKPc-GVcW3TcCCYvumN4ibfPcvdfnBdHzA@mail.gmail.com>
Subject: Re: [PATCH 14/16] pinctrl: qcom: ssbi-gpio: constify copied structure
To:     Julia Lawall <Julia.Lawall@inria.fr>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        kernel-janitors@vger.kernel.org, Andy Gross <agross@kernel.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 1, 2020 at 9:20 AM Julia Lawall <Julia.Lawall@inria.fr> wrote:

> The pm8xxx_pinctrl_desc structure is only copied into another
> structure, so make it const.
>
> The opportunity for this change was found using Coccinelle.
>
> Signed-off-by: Julia Lawall <Julia.Lawall@inria.fr>

Patch applied.

Yours,
Linus Walleij
