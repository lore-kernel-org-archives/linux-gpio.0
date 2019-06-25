Return-Path: <SRS0=lsbl=UY=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2CB31C48BD4
	for <linux-gpio@archiver.kernel.org>; Tue, 25 Jun 2019 14:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F3BE6208E3
	for <linux-gpio@archiver.kernel.org>; Tue, 25 Jun 2019 14:07:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="dBTA9gXz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728106AbfFYOHo (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 25 Jun 2019 10:07:44 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:42216 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726827AbfFYOHo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 25 Jun 2019 10:07:44 -0400
Received: by mail-lj1-f195.google.com with SMTP id t28so16392749lje.9
        for <linux-gpio@vger.kernel.org>; Tue, 25 Jun 2019 07:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=24XJTrHa0Yc4s3sKxxyNRNMHk8lPxt030dDP8xPw5N4=;
        b=dBTA9gXzvS9VHnSTxJ5VXq8BgDgH6lEyEC2arXbYVK3n3XqvVQxKWCN0aZsPBo7dNb
         NDF6mOHe5LhwpJp06hWsnvYcL6kDXe7UOikKtHyR3zJr6c8uDR3bW9CEJjbwSMqB9Mt5
         LuXHubjT/cdVNrbJHgjGvpV1HB82R5cvlHQ60TwKD77obG/HNRbkSByaGpwJFz5TnINr
         HLEK0cRLiOvK/8pvjvW2zGYDslsRXV0MmQkXndzpPlAtDceFvMD/dgrEU5rDSMLVAgXy
         g0Q6tT5nnF/hsp1ONNrpUiYScx47fPgEFw4n7+oMQkHkQAnPt3kpMz6KIU3p8M6g7xHZ
         /LIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=24XJTrHa0Yc4s3sKxxyNRNMHk8lPxt030dDP8xPw5N4=;
        b=DzgOZ1paorqfV2ijtRGLzklS+Z5BTMuGPCp2hlb16rC8dVWuEXJxhHqZNdXahyIast
         /npOKw0Ss7dGkxQoG11x6lBlqeC+4DkktgWVtkMsx8RqlVqT6ONFVUCPpoydLvSzFTv3
         n8rEo3eo1oEkgCwNXDmNN84ysKbpfG8U4sXWrc7y323wTrK7dNCRXGoQcXdOshT4qfmq
         lZ5wwCHSUQ1/NF59jYh0tIZwUR01p1GRC0inxu0G/sYhgNbR/8oVMZaUqcB8x1FA5bAa
         SUt5h1uwq8ztDXfNPF66wrYsEh8PMC3EvorQZJHNTh7trxsKxkqie0nZt6wOkFQ7b9H9
         hj7A==
X-Gm-Message-State: APjAAAUrXaR9y0HOWYTlv4Ei8m3EKhFf/7SEnVIavQhbs/o4YHDa8N3h
        3GBfVFFOwCk1pHDH43tuJVsZ9/5nTtCHiTT4vUnjtQ==
X-Google-Smtp-Source: APXvYqyjrDxpNXoWoBRzWyreU6t0oFZefNmzaDjlnTXV6ya4jhyfq+7zm2Vv8USOB8y4emzxmQG1awzZwLIh1cr2/8E=
X-Received: by 2002:a2e:a0d5:: with SMTP id f21mr52627090ljm.69.1561471662514;
 Tue, 25 Jun 2019 07:07:42 -0700 (PDT)
MIME-Version: 1.0
References: <20190621202043.95967-1-natechancellor@gmail.com>
In-Reply-To: <20190621202043.95967-1-natechancellor@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 25 Jun 2019 16:07:30 +0200
Message-ID: <CACRpkdZFvNNodNas2hQ-4iuS-UgHapMR-Y8f715Hbj_PH04iRQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: sdm845: Fix CONFIG preprocessor guard
To:     Nathan Chancellor <natechancellor@gmail.com>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        clang-built-linux@googlegroups.com,
        Lee Jones <lee.jones@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 21, 2019 at 10:21 PM Nathan Chancellor
<natechancellor@gmail.com> wrote:

> Clang warns when CONFIG_ACPI is unset:
>
>  drivers/pinctrl/qcom/pinctrl-sdm845.c:1320:5: warning: 'CONFIG_ACPI' is
>  not defined, evaluates to 0 [-Wundef]
>  #if CONFIG_ACPI
>      ^
>  1 warning generated.
>
> Use ifdef instead of if to resolve this.
>
> Fixes: a229105d7a1e ("pinctrl: qcom: sdm845: Provide ACPI support")
> Link: https://github.com/ClangBuiltLinux/linux/issues/569
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>

Patch applied with the ACKs.
I'm sure Bjorn doesn't mind.

Yours,
Linus Walleij
