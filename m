Return-Path: <SRS0=1K/e=WT=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37F52C3A5A2
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Aug 2019 07:59:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 026A7233FD
	for <linux-gpio@archiver.kernel.org>; Fri, 23 Aug 2019 07:59:46 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5FXlxmu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732906AbfHWH7p (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 23 Aug 2019 03:59:45 -0400
Received: from mail-lf1-f66.google.com ([209.85.167.66]:40405 "EHLO
        mail-lf1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731539AbfHWH7p (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 23 Aug 2019 03:59:45 -0400
Received: by mail-lf1-f66.google.com with SMTP id b17so6482034lff.7
        for <linux-gpio@vger.kernel.org>; Fri, 23 Aug 2019 00:59:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5z7vfbHtMApujxavzWgIXVc/rQILAwEhpus5OtLUmrs=;
        b=Z5FXlxmuxQ6DfUq/GB4OKAJfLFayCZSEywWTGWPqXb1Ll+4UtGZKe/h7W9WqxZFCL+
         4IiV1fF9W3GkwOQtesDOeraTHg4NaWNA/272Jwc0/BV+GsorLqj06xkS3dvXozEL7G94
         iasZEp6fG435M3O2KNTt9wHYTooFRDhji4NsuwBFQ1jYTuABI9bsPorCe4lFdDtqzLAa
         uLVEd+QUfe5QpHZnrDs9m+BETpOEdGSh05iLf3j26TB4s7L4BXt1q0jhFKZge6kKMizB
         VnC7jra0j8rvzwweeHGsz9xsn8iKUIHd2UekHeIJrYg7MpVeqfZJh8wEZVUW3mgQOsyu
         HhWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5z7vfbHtMApujxavzWgIXVc/rQILAwEhpus5OtLUmrs=;
        b=eGuEaZ40FfPsdPeo0imlBAl6Fzo8cgLKluGp1gA7cyek/NtFZDEBeYJfbOdEf9zUT5
         lFnpvFoEBcrGWBkSP6fd6S5chdBKQpOrTa/8LAssSmpoIEEgCeFHlltA3Kdo+kObuXnr
         DrJYpWV2uKCgGAwDtQalWKCPdg/SPiQDo9A7U7OwoqbhoM0cLxa6zqZ+CNy+pLQevuWW
         oxWbPeqhiMrKcYChWNNYX2hwBgjLdrvV1qO3H6zdHGM1nNd2/3xL2xPddHGzhhPJlpg9
         f0HrsrAmjecMfe6wBwGCAPq+hzEC4ugdnKYAwbtHhW6bDXNOHGiseonfF4VESLQ0e4mk
         csEg==
X-Gm-Message-State: APjAAAX66Q/qm9+KCzmbeAuesbyoeExNTHOH/m5gs7fAghJAefPHeycw
        EeMhyjcu/JErP+Y/1uFBJznmMUdhOXCnnuTBL9/hrQ==
X-Google-Smtp-Source: APXvYqz/JGdMYhTiM4E2N3WP4i5MloBBgn5IEamDPj4bNWv1rf+cVyUn1fnWDNPWIK8jDrnsG/09l2nJNj1VCjfqiBI=
X-Received: by 2002:ac2:59d0:: with SMTP id x16mr2059258lfn.60.1566547183271;
 Fri, 23 Aug 2019 00:59:43 -0700 (PDT)
MIME-Version: 1.0
References: <20190814123512.6017-1-vkoul@kernel.org> <20190814123512.6017-2-vkoul@kernel.org>
In-Reply-To: <20190814123512.6017-2-vkoul@kernel.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 23 Aug 2019 09:59:32 +0200
Message-ID: <CACRpkdZAsuU4kOHjgNT=q_PyONcZgor8CdgRRh=jFtF7YOqbgg@mail.gmail.com>
Subject: Re: [PATCH 2/3] dt-bindings: pinctrl: qcom-pmic-gpio: Add pm8150b support
To:     Vinod Koul <vkoul@kernel.org>
Cc:     MSM <linux-arm-msm@vger.kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Aug 14, 2019 at 2:36 PM Vinod Koul <vkoul@kernel.org> wrote:

> Add support for the PM8150b GPIO support to the Qualcomm PMIC GPIO
> binding.
>
> Signed-off-by: Vinod Koul <vkoul@kernel.org>

Patch applied.

Yours,
Linus Walleij
