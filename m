Return-Path: <SRS0=367Y=3M=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5BC30C2D0DB
	for <linux-gpio@archiver.kernel.org>; Thu, 23 Jan 2020 15:51:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2EDCE21D7E
	for <linux-gpio@archiver.kernel.org>; Thu, 23 Jan 2020 15:51:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZUaQSZhH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726232AbgAWPvc (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 23 Jan 2020 10:51:32 -0500
Received: from mail-lj1-f194.google.com ([209.85.208.194]:45494 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726231AbgAWPvc (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 23 Jan 2020 10:51:32 -0500
Received: by mail-lj1-f194.google.com with SMTP id j26so3975477ljc.12
        for <linux-gpio@vger.kernel.org>; Thu, 23 Jan 2020 07:51:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vdAmR20VKvZny3ZCIFF+8ow8IttknFIdrlHdXv4O28M=;
        b=ZUaQSZhHeaVvpK2bCqQh60+ZfTgbtx+VYEG3EhCHqaCZcJbcrvlvXlBvtasmJOoFUL
         Jo4QZUYkDAmGljhwgZtDlVPJOMiPRCUFcaKxHLSvGwEUT/Z+TxFC0CwY6IkEDozF6o1d
         /DzPl9LRnD9QmYxZmi82YrjYsb70/6C6uqhNmjaabeZbA3dlA3p/96XKmz9lFq2fXRlt
         fjCaOtICXGwzr7aj+OqHk7febBXpvWD0wUnm/NWcgahVX/8XgZm0jaoOb1iSdDPJa5za
         QrB8K2eqHFy/vh7iSw84qgCRvem4jtLvaPzEhK+QduS9EDUaSnoVa1nuImkRu4za9VB8
         hQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vdAmR20VKvZny3ZCIFF+8ow8IttknFIdrlHdXv4O28M=;
        b=lwjhD2lQP7rn0pD9t6ZSMuK+WSAu2c5nqAPLeHFfPqVSAl7JDlF4IgKVIRJCZzbRUD
         rXKXjvlIiQB5EJA4Tc6xKHf/UNxTkm1nbHpDu4cnFYarmihvWutxxXBIXj+GCqp0zz1X
         56eQJ7QNIxYstgxD4QVqpMMdv8oHIf31vrRz5gMhK7Y9316m1tTcoxApmELEcrgiTPvy
         HtPI3vpT9gcoYB2ZPr5k/LEDxaFhX6wc0co4X7yEfU5A+Sp+fEr6GPazWEkKCjma/hBr
         nHA3rXJqq9KdKv6Xmz8S7oxrqE500bc3DUeng6TGhC9EM1d05rHYs2L1XERCCu25a0my
         cQtQ==
X-Gm-Message-State: APjAAAVnpD0ulIlL08sqi4/IuC3FCzzuIrV+C2K2CFSu8J9zBXPQz3zV
        Uehfw3gMMYGlt0B/BdDjjnrQQp3Sa44o0Z9mANqoTJNDClM=
X-Google-Smtp-Source: APXvYqzTHx+ynAsEM3L5T+RMVEEf8yY0spWvfMCmhdiNnfrTvup7WbG3O3MVDgMO5KvY8Z8ciMWP+fctDWYL4bnsaGA=
X-Received: by 2002:a2e:9143:: with SMTP id q3mr23314797ljg.199.1579794690614;
 Thu, 23 Jan 2020 07:51:30 -0800 (PST)
MIME-Version: 1.0
References: <20200122111150.11033-1-ckeepax@opensource.cirrus.com>
In-Reply-To: <20200122111150.11033-1-ckeepax@opensource.cirrus.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 23 Jan 2020 16:51:19 +0100
Message-ID: <CACRpkdZR==orQwXzOe9LitS6WYiPKKJRXR5b=F5s4NBAx4j7fQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: madera: Remove extra blank line
To:     Charles Keepax <ckeepax@opensource.cirrus.com>
Cc:     "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        patches@opensource.cirrus.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jan 22, 2020 at 12:11 PM Charles Keepax
<ckeepax@opensource.cirrus.com> wrote:

> Signed-off-by: Charles Keepax <ckeepax@opensource.cirrus.com>

Patch applied.

Yours,
Linus Walleij
