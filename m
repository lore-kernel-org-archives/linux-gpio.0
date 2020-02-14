Return-Path: <SRS0=1EQs=4C=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E2DCC3B18F
	for <linux-gpio@archiver.kernel.org>; Fri, 14 Feb 2020 10:46:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1B193206ED
	for <linux-gpio@archiver.kernel.org>; Fri, 14 Feb 2020 10:46:37 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="RyOIgCO9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728807AbgBNKqg (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Fri, 14 Feb 2020 05:46:36 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:44167 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727965AbgBNKqg (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Fri, 14 Feb 2020 05:46:36 -0500
Received: by mail-lj1-f194.google.com with SMTP id q8so10147581ljj.11
        for <linux-gpio@vger.kernel.org>; Fri, 14 Feb 2020 02:46:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NeXjnE7r2g7NW/QZCMY8eogb8019UjNBERpksRztscA=;
        b=RyOIgCO9rwzLHRMzkzF15r94Gm7EFLx/l5Ek2m+SmkOaLf8KCd29ymRKiQHGtHzMO+
         SjWc4wnVuhLkn/tE6g+Z/HhOMKZurtEWt1CLOk97/vkVcPe0PeaE8DgE5s5IrYdeMT/y
         4hTSz3PGbn6yUUAsH+FyMtrWL23Hz3EuJc1ud4MtkQakJp19MzGQOs0kLLLPD8HQOccQ
         us9qWmU2bw2Km1qQjblxOgi5536a0XSIlPNm0UjAmRHkmSb8wdZixYiJuS9Sfl9qLRJK
         idQFhEdYShZ8OgDA0e++q6hokttEToCeomtqf8+akpiJmuT4T/6x2heIyQ5WvMHpum7B
         xFYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NeXjnE7r2g7NW/QZCMY8eogb8019UjNBERpksRztscA=;
        b=Dnf8rR/d83KWm92vUueJHMJPhllBd7DVNcc2QLwLRaBY9rEamLy8Qu09qW9rjfw34q
         0SruoM/4gBh++mI4/KfvIubq6fNeMuKyh4qGwVgdCyOF70yX/AYytkBlwscgEivElR4h
         ELmbVnjtDz7Ejb1RAnA5nb0x4lYZjsIsM9Wkq3IlIVAXDI5VgqcJ5Z0KIFCpLanpOyET
         VYQhpMmMAbM9rC9uqczpRfXNIn7WnyUr/NtLOBHsi8XmvpkIGBoGhFxdHHBHf0npHycR
         k+gYYox0TerkfDo9HNCCiO/djkJdwKZHP6aMCLokK7LtaxwQ6tzMP3krJhUPqLNjVQvX
         lVTw==
X-Gm-Message-State: APjAAAXtDAX2O3Kshr+j8zGpxUO2LnIVKv+UBv5CR7bNZ6ZDDZu66H9S
        s87yAbQxnN55Zo6+GxuE91FYpcdKPkUICvMVW25V5g==
X-Google-Smtp-Source: APXvYqzmdLdE8Rx/NNo5kXSwKXXl3RzcxUAwmAthly7FtdF/BpafqywcjF0AbGsPfO06POTuomc507bYl1nJS4URe7E=
X-Received: by 2002:a05:651c:1bb:: with SMTP id c27mr1767553ljn.277.1581677193251;
 Fri, 14 Feb 2020 02:46:33 -0800 (PST)
MIME-Version: 1.0
References: <1580148908-4863-1-git-send-email-stefan.wahren@i2se.com> <1580148908-4863-2-git-send-email-stefan.wahren@i2se.com>
In-Reply-To: <1580148908-4863-2-git-send-email-stefan.wahren@i2se.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 14 Feb 2020 11:46:21 +0100
Message-ID: <CACRpkdbcJwmVkT5kcR-ga3ejT4n8wbKPDJhFs_3Jp0-ZLKEWzQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/4] pinctrl: bcm2835: Drop unused define
To:     Stefan Wahren <stefan.wahren@i2se.com>
Cc:     Nicolas Saenz Julienne <nsaenzjulienne@suse.de>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Mon, Jan 27, 2020 at 7:15 PM Stefan Wahren <stefan.wahren@i2se.com> wrote:

> There is no usage for this define, so drop it.
>
> Signed-off-by: Stefan Wahren <stefan.wahren@i2se.com>

Patch applied.

Yours,
Linus Walleij
