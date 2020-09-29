Return-Path: <SRS0=mvGR=DG=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ABF4C4741F
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 12:56:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C9221207F7
	for <linux-gpio@archiver.kernel.org>; Tue, 29 Sep 2020 12:56:31 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="npuAc3Z4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729839AbgI2M4a (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 29 Sep 2020 08:56:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50598 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729532AbgI2M41 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 29 Sep 2020 08:56:27 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94C65C0613D2
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:56:26 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id c2so3913855ljj.12
        for <linux-gpio@vger.kernel.org>; Tue, 29 Sep 2020 05:56:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xwc6QcG165YvYnxLOr7Ig+7m7J7xD/MU+AJCfEa21vs=;
        b=npuAc3Z4q7b5/MOlpEyIxPMdkQkfGyy+xQQ4dKRXMIawUwLtwKv7YsAxgmdOIAcx0C
         V7aSDMhMMWCBgV7R53k9yA7j2I5W4AZ46AfJrz6OhlVZCCHbGROw1rxqKG/q+MGxp7R3
         5X7lZGeYG9wjg5iOKD+CMaqYx++eKtsyFZHwRyRyZhZ4EIdea/yrJ1hjkPWjyZUtYmJY
         /NzZuMCq9nTM5lHSOqzpSy/RIJ1yS4Y5K4NWCVNT025G5Au7oZ/8P0ZWcpC9ubw5bPtE
         28FyijSj6Hf143BqA8q5Bw42QsPFu2BOLKTYhIp9n/jDXmNoRO8UPQSEqhxWL/2qv/6C
         BABA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xwc6QcG165YvYnxLOr7Ig+7m7J7xD/MU+AJCfEa21vs=;
        b=p52R1FvAg4OcHsTjLLiVCE78SFfNliN8OmCNYEgJPl9i0cK7x6PO1cnqckbgjPuNgg
         dk046RR93PgF9Dm69NweZKVx3L6O4FPoaq48qWMoTTAbsfOYF+DecS+8xdgknPOABZqS
         QyZD2cWNwVzLoG2kNz+XsttsJH5NSJ4FTyIqxRql3zIt790aqiuVnZ11ENgEJsY5GOUg
         GIK2qzcGzs0v/LhsSxH2uCbgBB+9+h9RPfsavxxZp0aGOxYgkwdLB5Oi4/xrcNk+fgvw
         sLtbKgPCdtugbOVNvtHlCJbCOUZk/uQ9VplpXZ/7XId1cpbqg5vJgaLhKMER5eQMGfSj
         xcPw==
X-Gm-Message-State: AOAM531JU6Lx4o/mx357clh0K8wxuGQn0zS2ZHbaIIsKfnuuzQlHDPw3
        kV27gizpMROpTnQtuMQ61QiJfT/c+4ez9l1EYngikfah0v+xOA==
X-Google-Smtp-Source: ABdhPJw/sTFqnnCnmjiBkxcM336wh5a1yrj9eBOkl+NOXdP0eHGyLO27lGNGZcAFlkObJIC+WXvMMWTvGT4NVR1kG14=
X-Received: by 2002:a2e:a306:: with SMTP id l6mr1248375lje.286.1601384184843;
 Tue, 29 Sep 2020 05:56:24 -0700 (PDT)
MIME-Version: 1.0
References: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
In-Reply-To: <20200914091846.55204-1-dmitry.baryshkov@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 29 Sep 2020 14:56:14 +0200
Message-ID: <CACRpkdb2WnQ40oZQZ3GN=ynhgZTmpJqT1yVuEJejOGQ7qe8pwA@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: qcom: sm8250: correct sdc2_clk
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        MSM <linux-arm-msm@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Sep 14, 2020 at 11:18 AM Dmitry Baryshkov
<dmitry.baryshkov@linaro.org> wrote:

> Correct sdc2_clk pin definition (register offset is wrong, verified by
> the msm-4.19 driver).
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Fixes: 4e3ec9e407ad5058003309072b37111f7b8c900a

Patch applied for fixes!

Thanks for sorting this out.

Yours,
Linus Walleij
