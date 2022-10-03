Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E77C2C433F5
	for <linux-gpio@archiver.kernel.org>; Mon,  3 Oct 2022 18:57:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229656AbiJCS5q (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 3 Oct 2022 14:57:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47292 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229574AbiJCS5n (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 3 Oct 2022 14:57:43 -0400
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9A23520364
        for <linux-gpio@vger.kernel.org>; Mon,  3 Oct 2022 11:57:42 -0700 (PDT)
Received: by mail-ej1-x632.google.com with SMTP id a26so24184320ejc.4
        for <linux-gpio@vger.kernel.org>; Mon, 03 Oct 2022 11:57:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=TC+pHMV1HCDu2K8ju3lln4difJwCLYwNsc8jznPs2wc=;
        b=Fl24iU1DKzubOlAHqax3lecBZDt018smBQkqCbMZGoaPFMGq0qiXYayZUXpfLeIlUl
         EuPMpdhEZV4llPENJVwg8jKqo5MurVTefe/VVQePameVEoeqDiAvgzSKh042IhTptK49
         nRQHJ6TN32Rp+lb8VRBh2vROE0kjdRpU6ucmVH69/0+1wS0wz5mxUwyVXwa4i87ZU4Y6
         rKD9NGidF0DnzjLRmoODJR0gwtdE9sSMzuDkY4hkiqZv+ejD+llijlO0ZSNxxq1jmki6
         WQCNZEhrosBii9PYkD9FIMzgoKDRj2gnjsI+2YKlskblr81VqwNaAdoBQ6fW1LawT/MC
         SqcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=TC+pHMV1HCDu2K8ju3lln4difJwCLYwNsc8jznPs2wc=;
        b=DUXFqEfwNc5rRCdszvoUW+r2LSjD0NArQ9ZCIctSiK9TV8ejbKAfBN1KGtu9z+/yTi
         yehJaNcuryM1xf1ZNRvuH+ovakod23xD8pvg9bGSQO7GBumD8I7DigUyQWWSSi1/+yzO
         Vl6CDecukTXDLksi2UznrhafewkzgSzJULbjM37f1TzQO/goxk4GTeREvWNuAqhNxXpb
         9+CnG8mxTzU5ufKN8FWGn91BzCgjkLN2/6EOIZ832Mb7mFe/bqhn5rrsIcOyNbjoXiQL
         SUb1r3wLiS/1U0JMg5g7tM31gYUfyJKd/iOTtXnNAzZGJ3xVD8nQZ3jLEfaQi5cOnUGn
         IP4g==
X-Gm-Message-State: ACrzQf27LHUyv/fqM51WhKnLIDfSY4GxpwqrxlZMltaQMPcMUvj2bCMO
        EmdSoR5bGclNwYKJs2dYb8H7p4Ln8yZpS87JINJUZg==
X-Google-Smtp-Source: AMsMyM7iZ+IV2KNHk1Oa22FwFLHmM7i+dJoYsaKpBJqhFJECdNz3CnPXETmuwfAJTJY53oDj+8FLIawzEWB9kABrqqI=
X-Received: by 2002:a17:906:9b86:b0:73d:72cf:72af with SMTP id
 dd6-20020a1709069b8600b0073d72cf72afmr16122295ejc.440.1664823461226; Mon, 03
 Oct 2022 11:57:41 -0700 (PDT)
MIME-Version: 1.0
References: <20220929181505.1100260-1-f.fainelli@gmail.com>
In-Reply-To: <20220929181505.1100260-1-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 3 Oct 2022 20:57:30 +0200
Message-ID: <CACRpkdbu+E-Go4dEBFHb3Rwp3StNJGoctSDEkusL9r8kM1p_qg@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Update TI bandgap and Davinci GPIO entries
To:     Florian Fainelli <f.fainelli@gmail.com>, Keerthy <j-keerthy@ti.com>
Cc:     linux-kernel@vger.kernel.org, daniel.lezcano@linaro.org,
        rafael@kernel.org, linux-gpio@vger.kernel.org,
        Bartosz Golaszewski <brgl@bgdev.pl>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Sep 29, 2022 at 8:15 PM Florian Fainelli <f.fainelli@gmail.com> wrote:

> The email j-keerthy@ti.com is bouncing.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

...but Keerthy sent mail just a few days ago?

https://lore.kernel.org/linux-arm-kernel/20220922072950.9157-1-j-keerthy@ti.com/

Yours,
Linus Walleij
