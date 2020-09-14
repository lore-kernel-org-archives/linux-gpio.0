Return-Path: <SRS0=IeOR=CX=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C82B5C433E2
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Sep 2020 09:19:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 682AB221E8
	for <linux-gpio@archiver.kernel.org>; Mon, 14 Sep 2020 09:19:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="VyxKPcjW"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726305AbgINJTm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 14 Sep 2020 05:19:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726289AbgINJTh (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 14 Sep 2020 05:19:37 -0400
Received: from mail-oi1-x243.google.com (mail-oi1-x243.google.com [IPv6:2607:f8b0:4864:20::243])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21111C061788
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 02:19:35 -0700 (PDT)
Received: by mail-oi1-x243.google.com with SMTP id n2so17163814oij.1
        for <linux-gpio@vger.kernel.org>; Mon, 14 Sep 2020 02:19:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=PntEDM7LF9YFHS/fGomhwipLRARKe4IjmrD2LSF9a3U=;
        b=VyxKPcjWnBBwHP+A6iZKryD4xkDXQ5KFR9iVkwHUK3DCvLDl6GJALmKd62cETe/T/h
         5cp95uIBwLWal7kiXal3YRWAWWTawzHD1oFcfae9so+04qVSxMUbVdaa96q1WC3laz+F
         QVCZq5SB0Y5EGEhdI4T2qGTi2V0WrRHuHjYSYPHJocsPBCSf8u21NkRJEcg83cThOK78
         xllBmvMh3A0743AueKeJTlGLfIzRCzAhzSet5wwcih0rG6mQffVmVkxaOippCE9Bk7cQ
         0CmqCIM8zdJbRD3UwUu4kMbY2ijPykTio/c9MVtmP3GyHGXKohsTA5qdc6Uo56/dEF3G
         8M0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=PntEDM7LF9YFHS/fGomhwipLRARKe4IjmrD2LSF9a3U=;
        b=E84TX/O61iNxWSZcNRHqspn0NK23PbgUVPkHxCMXURCxLRbt3JfoCoi+b/t6dh6yqA
         0cWf9fTlybfsSPMqiXajpPIEpi2CLdmmao8r1fjgZ7xB75S8uDkRFDMDtv3kJt76a7KU
         fZCZJJRTnKe1v5ykZn7/xfwy2OER3lzczKyv58d8WJ8bwgNt3sujTKf6WSWOEEfNuUz0
         snzHPrQntBo4Y1VProhpkb6oALV4kMVK6qGzUwY9lCPUplNr5wTZWKvqkrc5mgXlGVUx
         eJBZ1s3qJ+Kj4a2WuCvIv6LoJqEl1Otuh5WHdFaONaFTu7aEgF3j7kzoe6+m9R1/0MtD
         XHxg==
X-Gm-Message-State: AOAM531ND5fvxCahkpyuI91MkGzTfRNxlKZysAaFg4MPbpToFWqlMG/e
        +6cfyzCTr+KX9aMl6gvZZDy6BlgIKcDp5c+ar+KMLQ==
X-Google-Smtp-Source: ABdhPJzlVYpLLKBqckSp7cRsb8j0H8g/8KzM210y/SP/BYJaFBsL0tM+uwdKjUZ9Xls9z1uoNnukdCcEAIT/PhlQ8dc=
X-Received: by 2002:aca:2301:: with SMTP id e1mr8577962oie.177.1600075174577;
 Mon, 14 Sep 2020 02:19:34 -0700 (PDT)
MIME-Version: 1.0
References: <20200914001229.47290-1-dmitry.baryshkov@linaro.org> <20200914002314.GZ3715@yoga>
In-Reply-To: <20200914002314.GZ3715@yoga>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date:   Mon, 14 Sep 2020 12:19:23 +0300
Message-ID: <CAA8EJpoti+s6nh59UFYkNR9+xeb8_zgxUdcbzRnrdwi7qvV2rw@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: qcom: sm8250: correct sdc2_clk and ngpios
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:DRM DRIVER FOR MSM ADRENO GPU" 
        <linux-arm-msm@vger.kernel.org>, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, 14 Sep 2020 at 03:23, Bjorn Andersson
<bjorn.andersson@linaro.org> wrote:
>
> On Sun 13 Sep 19:12 CDT 2020, Dmitry Baryshkov wrote:
>
> > Correct sdc2_clk pin definition (register offset) and ngpios (SM8250 has
> > 180 GPIO pins).
>
> The second half of the message is no longer relevant, and you only need
> one of your s-o-b below.

I should stop sending patches at 3 a.m.




-- 
With best wishes
Dmitry
