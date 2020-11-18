Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 04FE8C56202
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Nov 2020 01:14:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A75F224671
	for <linux-gpio@archiver.kernel.org>; Wed, 18 Nov 2020 01:14:13 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="a0TP9kER"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727263AbgKRBON (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Tue, 17 Nov 2020 20:14:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57618 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727013AbgKRBON (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Tue, 17 Nov 2020 20:14:13 -0500
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com [IPv6:2a00:1450:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF746C061A48
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 17:14:12 -0800 (PST)
Received: by mail-lj1-x242.google.com with SMTP id x9so476950ljc.7
        for <linux-gpio@vger.kernel.org>; Tue, 17 Nov 2020 17:14:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YUb4InXM6h8baMwLvQZGh7WKS3CCFmLmmq7Z1kBSpNE=;
        b=a0TP9kERQXJnDl9GjVSSYY9NVJ9SckBOY6O+44VsTmawkCg+iTQztRBlDtAm/XxNjU
         gDz0QEoulcCpy8illz1ykdWie5VIfObF8vCt4kEdAQSlG2e6LQQvJUCNTds0WzeOb98w
         OTEwniWheT1wYq0LJnOLXT/GIAPuo916EEyasKDQ4+q3QjiX+APNqTsHbZXtuWjQdO4v
         9oApxIQcHgPyBDLIoVHk3H5mCDZe/6CYGLMfnJC5jFJG1RJyzQoXjnTM9oWpGJIaKQiK
         UcSCl4r22YEVuWVjwQ+oPPoEjxRqqcAQu2WX4e0GCdtM4eJWaLXl4vWn3xQ2c4ivnpDi
         X82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YUb4InXM6h8baMwLvQZGh7WKS3CCFmLmmq7Z1kBSpNE=;
        b=k4SVWNT0J18DZg172v63GbFMyIr3VcVzeOyskz61m4pIdVW+bqQbBbQQGLQmTFw7o9
         AxDuhLIBScO/44mlLakwrbfKf/NrJVBPaf2kixQs1xXXRDnscG9nipVXIiZzNzEBWwtv
         OwWOKRH5Dj4duqiziCNs2nLM/6uk7omsPpMxJILfnAdx60uqDr75n6BRhbTceaItqAia
         OBTVjSRwkkSFPQwvQp55uG3krKbchpX0m/NHJjJFAAQ9/xconT9InH8jxx4tRmIe+i3D
         MWm1JW8oqKfYHnd4U+UAcrNk90AXysf2+GZYj1iitNvcjC04fqXgfYy3jN74WThDUfoP
         oJaw==
X-Gm-Message-State: AOAM5308jbifs/lP43a+i0RujGDbwot0kEHnQc6+zHxU8hWDiZ1BO8v6
        eD5tlyWRHpLtxHPQBUxb70SfCMlXx1QQAGRy9XR8Kw==
X-Google-Smtp-Source: ABdhPJyeLqgm2q/ZgSv/hQqyu3zbyeo4KASMlJbzx6A8oYU1FylwQTyIkB2W4YvCWkdzVzaRAgYDEtoUbPG9Et199YU=
X-Received: by 2002:a2e:7c03:: with SMTP id x3mr2645033ljc.338.1605662051195;
 Tue, 17 Nov 2020 17:14:11 -0800 (PST)
MIME-Version: 1.0
References: <20201117105917.27591-1-festevam@gmail.com>
In-Reply-To: <20201117105917.27591-1-festevam@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 18 Nov 2020 02:14:00 +0100
Message-ID: <CACRpkdZxuuym1jVErM3Arv9nafuoURvakLg_1vdYvdBhnkZaqw@mail.gmail.com>
Subject: Re: [PATCH v4] gpio: mxc: Convert the driver to DT-only
To:     Fabio Estevam <festevam@gmail.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Andy Shevchenko <andy.shevchenko@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Nov 17, 2020 at 11:59 AM Fabio Estevam <festevam@gmail.com> wrote:

> Since 5.10-rc1 i.MX is a devicetree-only platform, so simplify the code
> by removing the unused non-DT support.
>
> Signed-off-by: Fabio Estevam <festevam@gmail.com>
> Reviewed-by: Andy Shevchenko <andy.shevchenko@gmail.com>
> ---
> Changes since v3:
> - Fix the logic to only evaluate to mx21 as the original implementation.
> - Added Andy's Reviewed-by tag.

Patch applied.

Yours,
Linus Walleij
