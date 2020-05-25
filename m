Return-Path: <SRS0=HYd6=7H=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0907C433E0
	for <linux-gpio@archiver.kernel.org>; Mon, 25 May 2020 11:31:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B3FDB2078B
	for <linux-gpio@archiver.kernel.org>; Mon, 25 May 2020 11:31:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="jo7Vn4e5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390387AbgEYLbQ (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 25 May 2020 07:31:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390143AbgEYLbP (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 25 May 2020 07:31:15 -0400
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2023C05BD43
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:31:14 -0700 (PDT)
Received: by mail-lj1-x242.google.com with SMTP id z13so10713480ljn.7
        for <linux-gpio@vger.kernel.org>; Mon, 25 May 2020 04:31:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jH3BTO4OaLIgfrhXrll41GqJ8j6vlfXlN+l6Q0SbCkk=;
        b=jo7Vn4e5TVXYw42XMs4yncszg3khjtfiTt9MmOySiJywQInpoDyZdPkuWOmWYG+x9V
         poYskqWO3dxaTQL8TziyfGdYfEqS4OJme+QvbTt82QsPlenWAdGh3gjTnHmrMlTxBm5E
         1k4B5IXlGNZIukjWDoQZMZ49avEuVvCen1E3bih46FRs3Du5nlVFkQFDbWi4C/pi2VfO
         rgihfDdMTc7b0DKmflceZ/YmKZ5PkPlb68cZ9rYnqNoHAPkiswQeyzZ8C5cqIk8V2vQS
         +Jwx6DHqw0eySmWyTw7XaAT2CEKH/VDdubFkWkNfXhLYCF2HfXrkLYz7l/bBzfZy6a+5
         zfNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jH3BTO4OaLIgfrhXrll41GqJ8j6vlfXlN+l6Q0SbCkk=;
        b=e0/Uo0lm5ceLNJActlpM3EhM5t9eqQHeob+hhyjEZACNuaasm6hSXZdjXb7SNmIsSt
         ZyiZSQKQ60h4kUxJdGRFJYzD5Vn3VNO8GAfU0/ffEbNI5UwjSg7zMowRHBtlAel4/5qN
         MJzd7kXCXkcPkIZ9dv4HSHvI/dhR6tGcRE16+hgDUjgHCCx03iDfsdCD1wBtpXwRsopg
         Vd6DWBSbHTuRLpr2bEJWM38VseWLVgXECyjhX4DouHv/YTPeWOED0BmWJDagT6kGXBAx
         TVQ3NN1uH+QaJVuUl6V1yCt7jkREi/d6e2cwjBwIC9QK3PBvxll1YaNigbVadsOYRQu0
         ITrA==
X-Gm-Message-State: AOAM532PuKewrMrY3YPb0Kh4NxRLiqOS6ZRrTf/o3Yh9rfhUuEiVdcrM
        eUiqye1C8fhivO0Pk3vV2q5e62gornwhCErvJZz3tkuV
X-Google-Smtp-Source: ABdhPJx7Da3aXta7XwCCKYM29dZF6eBtJ4NMtIZQOG4fT6BwoWWfIhe/OCu9vqTrIuP+2W3IgRkAIhSEw2J1qOsEN60=
X-Received: by 2002:a2e:8703:: with SMTP id m3mr14332878lji.286.1590406273412;
 Mon, 25 May 2020 04:31:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200522080839.32612-1-dinghao.liu@zju.edu.cn>
In-Reply-To: <20200522080839.32612-1-dinghao.liu@zju.edu.cn>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 25 May 2020 13:31:02 +0200
Message-ID: <CACRpkdbwwZm+FF1cOxJ0xuKi=BmmV49Xno2y6A2QqMCctin=ag@mail.gmail.com>
Subject: Re: [PATCH] gpio: rcar: Fix runtime PM imbalance on error
To:     Dinghao Liu <dinghao.liu@zju.edu.cn>
Cc:     Kangjie Lu <kjlu@umn.edu>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, May 22, 2020 at 10:08 AM Dinghao Liu <dinghao.liu@zju.edu.cn> wrote:

> pm_runtime_get_sync() increments the runtime PM usage counter even
> when it returns an error code. Thus a pairing decrement is needed on
> the error handling path to keep the counter balanced.
>
> Signed-off-by: Dinghao Liu <dinghao.liu@zju.edu.cn>

Patch applied.

Yours,
Linus Walleij
