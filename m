Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DE10EB64DA
	for <linux-gpio@archiver.kernel.org>; Mon, 19 Jun 2023 08:54:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231176AbjFSIyS (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 19 Jun 2023 04:54:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52830 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbjFSIyD (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 19 Jun 2023 04:54:03 -0400
Received: from mail-yw1-x1131.google.com (mail-yw1-x1131.google.com [IPv6:2607:f8b0:4864:20::1131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5188E115
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:53:18 -0700 (PDT)
Received: by mail-yw1-x1131.google.com with SMTP id 00721157ae682-57338656a8aso4994487b3.0
        for <linux-gpio@vger.kernel.org>; Mon, 19 Jun 2023 01:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1687164797; x=1689756797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GLxFZi7zXkcKU5LLEJg/aSz/OCXeD9wZDC/9zhkx7NQ=;
        b=UaIka0b2cvYeaN4KTZouO6vXEBL150GxuHpHx6GjMn5ntJ95fq817okG5YGSunCMt8
         fBViAWgWIKVcMUMmchxHs9CPMKyYGVCqo3+u+WHssXrPPGvpQgbWGrRzikZQSoPxXNni
         GgiRrzr5lHLcDdLudzV3MB2c+RVB7avGInueRc/IQLuY8MozZaqnH3z7SbesaR6E6rnM
         y5YvPZgr/wo+usbhooq9luiTBXyWYh8CY/7TRD5WLRUiz1J2JO4/M/WHQ0RH7vrdNQq4
         oHP9BQso06OYZZElDaV9FXa58MlczvTEw6ePLOCyMpeomy3KCoN1IAs66TgbM+pNp16C
         ruBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687164797; x=1689756797;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GLxFZi7zXkcKU5LLEJg/aSz/OCXeD9wZDC/9zhkx7NQ=;
        b=Lu3eC8zhpp5ObsXEX/nQpUKEQvcLRnHdiHU3WY+mpT1Uy4j1/gj1hCafOpY1AU4hpt
         V6kgILBcwBI1WrZFMEBk/B7iMtNeZVVdQe7RMED1bn9mNiSEApMCPPj1PXUrzhpbU1O6
         TXNt9xuuF/bYlOF5YmwSmDhXoz7HK0Ut43O+UZtwSXmNgDzv9jOq9vYWORpOU43niJAV
         ZcUdqoYk1H15MYz0wrF03fTNQHPpU2I4fG0BpA2S3j/bOjYeMThX/VjY7y4isdOgadI/
         32Df15oTblY5Div6NKHzsMNq9TJ3cRCiOBLYoMSW1dO2yiqISYTNb3D6Su1nDeN8KcWQ
         FE1Q==
X-Gm-Message-State: AC+VfDwzlVCCie3i+U+C/jCxar5CM+8skmsWfd/jPa3Bi8XnZuNmFOLg
        T+p3i7w4Kp2WSYa7/eX6yIZcBrP54cVcc0tT204RiQ==
X-Google-Smtp-Source: ACHHUZ4EywsUOBheswAbpJNJBP2MwZGkmFErpy/TTrkqdxKojVFCzC0SsE1b18OVK/J/9I+lSIGdtzwBbOTZXtNRoSs=
X-Received: by 2002:a25:8487:0:b0:bc9:1019:54d with SMTP id
 v7-20020a258487000000b00bc91019054dmr4104717ybk.18.1687164797486; Mon, 19 Jun
 2023 01:53:17 -0700 (PDT)
MIME-Version: 1.0
References: <20230617111809.129232-1-krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230617111809.129232-1-krzysztof.kozlowski@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 19 Jun 2023 10:53:06 +0200
Message-ID: <CACRpkdZpiJtRnSWGX+mZSPkXoY3ooauzOxpPF038qPRN9MNORQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: qcom,sdx65-tlmm: add pcie_clkreq function
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        krishna Lanka <quic_vamslank@quicinc.com>,
        linux-arm-msm@vger.kernel.org, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Sat, Jun 17, 2023 at 1:18=E2=80=AFPM Krzysztof Kozlowski
<krzysztof.kozlowski@linaro.org> wrote:

> DTS and driver already support pcie_clkreq function for a pin.  Add it
> to fix dtbs_check warning:
>
>   qcom-sdx65-mtp.dtb: pinctrl@f100000: pcie-ep-clkreq-default-state: 'one=
Of' conditional failed, one must be fixed:
>     'bias-disable', 'drive-strength', 'function', 'pins' do not match any=
 of the regexes: '-pins$', 'pinctrl-[0-9]+'
>     'pcie_clkreq' is not one of ['blsp_uart1', 'blsp_spi1', ... 'gpio']
>
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Patch applied!

Yours,
Linus Walleij
