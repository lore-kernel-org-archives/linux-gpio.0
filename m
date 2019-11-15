Return-Path: <SRS0=05vI=ZH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBC40C432C3
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 19:33:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B39112073A
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 19:33:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VX0ZB3rz"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726865AbfKOTdo (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 15 Nov 2019 14:33:44 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38377 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726466AbfKOTdo (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 14:33:44 -0500
Received: by mail-pg1-f195.google.com with SMTP id 15so6454273pgh.5
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 11:33:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=QU8ftRvacoDuTomibhxhdB7IDINe+ys+Qkj4rwds7Mg=;
        b=VX0ZB3rzl89z63DG+Wvs3uHd1KerGZX5ck8uMP9WhwZZWmMHQE1B6NJkiq8xN6zyXT
         inVRONhwSI7sdfpvXidHLr5YT++pVIbEJO309pxXnt0p6iSHy4/rVcvF1by5HelxF2Ry
         uK/57BXB1NEy922s1wLo7H9Y1FsRpyFgBH8+Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=QU8ftRvacoDuTomibhxhdB7IDINe+ys+Qkj4rwds7Mg=;
        b=lK0qm8iliHpuWG/6Uu8EUiLfVQiZ0SQX/kib8KF8E8BQEPXsOOZ7O6ad6XO+MpJFhM
         FP7IB79dMzha13M38DAqXwo6GajxKNDuTKjkMvj1brHH/VetPObjrPt0Wm55qln+9xHx
         8jlFHjSqaPW6ACoz1grgQZFqjdnt1y9OpEvPSNZHp6iFPgn1cfhLxX0pKt1yZVRiw1XK
         cbbsrvABH08ANzVp24azp5v9P6vAIAxSCSqY0U5oT0+8JnVNpezQ8aks5099QahSD+Pj
         Y7UxYMYvYHBmPQ6mLScJaQKfVdWy7WobUVoslGM3g1rQtwXB9WWeVx9aRfuNkJ6Z+Wo2
         u/LA==
X-Gm-Message-State: APjAAAVYHhjfNpkrUA7qKs8wg9ahKXeKVq4+iEZAncTQXsEqcGE+5Thw
        2OZX5VIq96o9GRvzbmZ9j70PWQ==
X-Google-Smtp-Source: APXvYqzEiRCO/7qW1HDucD+lA/+5Kfj2lS10aAUFQkLnRD84SabthWIlz9xkAHhSgpz22fx7t9DiYw==
X-Received: by 2002:a63:c04f:: with SMTP id z15mr4336536pgi.52.1573846423509;
        Fri, 15 Nov 2019 11:33:43 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id u3sm10059508pjn.0.2019.11.15.11.33.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:33:42 -0800 (PST)
Message-ID: <5dcefd96.1c69fb81.d7d72.ceb2@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-10-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org> <1573756521-27373-10-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 09/12] drivers: pinctrl: sdm845: add PDC wakeup interrupt map for GPIOs
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:33:42 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:18)
> Add interrupt parents for wakeup capable GPIOs for Qualcomm SDM845 SoC.
>=20
> Signed-off-by: Lina Iyer <ilina@codeaurora.org>
> Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

