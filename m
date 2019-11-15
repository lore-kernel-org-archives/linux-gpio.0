Return-Path: <SRS0=05vI=ZH=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.9 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E7CFC43215
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 19:35:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 57FFB206D9
	for <linux-gpio@archiver.kernel.org>; Fri, 15 Nov 2019 19:35:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="nNA3Mbuj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfKOTf1 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 15 Nov 2019 14:35:27 -0500
Received: from mail-pl1-f194.google.com ([209.85.214.194]:40557 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726912AbfKOTf1 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 15 Nov 2019 14:35:27 -0500
Received: by mail-pl1-f194.google.com with SMTP id e3so5339401plt.7
        for <linux-gpio@vger.kernel.org>; Fri, 15 Nov 2019 11:35:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=message-id:mime-version:content-transfer-encoding:in-reply-to
         :references:cc:to:subject:from:user-agent:date;
        bh=0GdbKxm4O06qcVrBG5OQKzuSxJR0rALm31Y5pRBreDU=;
        b=nNA3MbujN/YiXOf2jwbxnXZ9cJW2oKdlhQCn0HBLJ7iLOlsKtLLgnNI2i/lOZu9x96
         tqraB0HHiCwLo2yJKhnm2LSpsDAvYr0gTm2PhLBi5K1p4T+NmJyfqacVSK7vGnKEqN7K
         ZjacI8QSmMk4RkPCkYwyoFRGoF/dz0Ew+6kKA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:message-id:mime-version
         :content-transfer-encoding:in-reply-to:references:cc:to:subject:from
         :user-agent:date;
        bh=0GdbKxm4O06qcVrBG5OQKzuSxJR0rALm31Y5pRBreDU=;
        b=Q7/0vCobkAi7TLZovKhpXIn+2NlITLxV9PPbZ8/FWYWqirAItIB+ZVYP97DavI6B0k
         g00fRBmOYXrA2pF2gA+bT+z+6RXeXAH6x01jwtSYjuSK0kCM73O8opPaLzXbCz5UegnN
         9gnO7P2lEZijjdwO9Bn5yME2zFVf1GxkDaBXc0d4WqjEjSdXFVTQP0oUqz5pvmRSIo/X
         cfKxRbpGBQ9ywG7CjOe79IWxeJdFbUb3MNgN0b9RmxizbDCDjBp3lBW7RhC5/PPW/onW
         rC/EW82hrEAwuFc4VvA9/ANHbQjxqYOCcPsZ8jDG5YD+0MiyOPPs154c5t4VuWwQLH+I
         6vUQ==
X-Gm-Message-State: APjAAAWhESjh4RPY9BwAald00f9yyAcSaOOWjt2UhRHLFaMKvAdkJFLI
        n8GLq7MGNkwjfN6ubPe2t5qqZA==
X-Google-Smtp-Source: APXvYqxey8HESr3lbZNCca1HgYXDNaCHybMBL0Y9MebASO2LIrZ4la6qOqZIenIWmHeA3gfE/BO0tg==
X-Received: by 2002:a17:90b:3d3:: with SMTP id go19mr21846617pjb.78.1573846526161;
        Fri, 15 Nov 2019 11:35:26 -0800 (PST)
Received: from chromium.org ([2620:15c:202:1:fa53:7765:582b:82b9])
        by smtp.gmail.com with ESMTPSA id e17sm11201274pgg.5.2019.11.15.11.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2019 11:35:25 -0800 (PST)
Message-ID: <5dcefdfd.1c69fb81.c5332.fbe0@mx.google.com>
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
References: <1573756521-27373-1-git-send-email-ilina@codeaurora.org>
Cc:     evgreen@chromium.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, mkshah@codeaurora.org,
        linux-gpio@vger.kernel.org, agross@kernel.org,
        dianders@chromium.org, Lina Iyer <ilina@codeaurora.org>
To:     Lina Iyer <ilina@codeaurora.org>, bjorn.andersson@linaro.org,
        linus.walleij@linaro.org, maz@kernel.org
Subject: Re: [PATCH 00/12] Support wakeup capable GPIOs
From:   Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.8.1
Date:   Fri, 15 Nov 2019 11:35:24 -0800
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Quoting Lina Iyer (2019-11-14 10:35:09)
> Hi all,
>=20
> Thanks for all the reviews.
>=20
> Here is the next spin of the wakeup capable GPIO support. In order to
> facilitate basic support available in the kernel, I have dropped the SPI
> register configuration. The feature was added when this series was
> restarted based on new hierarchy support in gpiolib. But, the SPI
> configuration can be done in the firmware. This would avoid a whole lot
> of code in linux that serve little to no purpose. Users of GPIO never
> have the need to change the trigger type (level edge and vice-versa) and
> the basic configuration can be set in the firmware before boot.

Awesome! I'm glad we don't need to worry about configuring that in the
kernel.

