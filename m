Return-Path: <SRS0=05vI=ZH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95264C432C3
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 19:03:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6FE7C20732
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 19:03:43 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="dpf+SQ7c"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726605AbfKOTDm (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 15 Nov 2019 14:03:42 -0500
Received: from mail-pl1-f193.google.com ([209.85.214.193]:33683 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726865AbfKOTDk (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 14:03:40 -0500
Received: by mail-pl1-f193.google.com with SMTP id ay6so5292216plb.0
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 11:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=Sf8hVOxBk+v+gxcir+4F57LHQMoNbCBmUatVAasXqUI=;
        b=dpf+SQ7cYXFz8VFGhLaCxFlRNFwVU6io27htd8W8xZUqH6T/6LpIu3esdT9VZd8Q7r
         xMYQSaYQdDb4Oiizw9nbCBE8kf3gxnYVSXg2dBFNd3Bv1c32jPzgxiBZx7y102b9q7DA
         C/mQuicgQzz+HBv485SrFyAtj4gg/bXeggYdg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=Sf8hVOxBk+v+gxcir+4F57LHQMoNbCBmUatVAasXqUI=;
        b=KhrbHRdPf6zsTyHv5VybxEjz25VSKDVPRxlFfmm3wW4IjSEfIZ4q709H2AidOpQgEg
         NVsT6k7SlqmYcFglPICb8dKbaHkQ3xxTSykM7vp9+8929zXAxFPQZBWjEKChrg0G1O9D
         qHTIVXhJFIP/LFT/r7uSYLWvW1PB6vNnwsLl/z14msZ4K0GvalrZKbYx4DkQxPCYsKA8
         tGyPe2LbsGvpy1wypJZTOSBMw3jvw6dNtg692lrAMKlV1zBB3l5SMRbDIdVgxD0XjWsY
         COX1Ti4HO54Jb9Xt4E/GLzoAXItyS1HF47C/adxMQFO34byNkeUv6Ch04dg+akkDMuhC
         0dhg==
X-Gm-Message-State: APjAAAWcatcp/Bb4FguBIWGQkyQ2mlAt6R5Cjns7bScW8UXPeFRBROue
        5NaUKdTS47AWZPAeA3dJw1wwow==
X-Google-Smtp-Source: APXvYqy46D/+eMdkJKqRHNHKY3j4WXnNRliCzO00Y7Go8wO+7xzyw5HOgUHHtReWL9NDepjOlQCqdQ==
X-Received: by 2002:a17:90a:4d8f:: with SMTP id m15mr11777246pjh.71.1573844619605;
        Fri, 15 Nov 2019 11:03:39 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id a6sm12317493pja.30.2019.11.15.11.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:03:38 -0800 (PST)
Message-ID: <5dcef68a.1c69fb81.3dc50.3afe@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-5-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-5-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 04/12] drivers: irqchip: add PDC irqdomain for wakeup capable GPIOs
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:03:38 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:13)
> Introduce a new domain for wakeup capable GPIOs. The domain can be
> requested using the bus token DOMAIN_BUS_WAKEUP. In the following
> patches, we will specify PDC as the wakeup-parent for the TLMM GPIO
> irqchip. Requesting a wakeup GPIO will setup the GPIO and the
> corresponding PDC interrupt as its parent.
>=20
> Co-developed-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Stephen Boyd <swboyd@chromium.org>
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

