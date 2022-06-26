Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6236CC433EF
	for <linux-gpio@archiver.kernel.org>; Sun, 26 Jun 2022 12:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232557AbiFZMya (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Sun, 26 Jun 2022 08:54:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230153AbiFZMya (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Sun, 26 Jun 2022 08:54:30 -0400
Received: from mail-vs1-f49.google.com (mail-vs1-f49.google.com [209.85.217.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 49E01DFC8;
        Sun, 26 Jun 2022 05:54:29 -0700 (PDT)
Received: by mail-vs1-f49.google.com with SMTP id z66so6605328vsb.3;
        Sun, 26 Jun 2022 05:54:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc;
        bh=Y1c761+qMs56k1dAqGKMqBmJpf9IXtE8ICwD+lzxkJU=;
        b=MF0S+Uwh4paVZXg5mq1xtzbHvI7+tAiS9JrxQ8avHzGfyiAsmU0Ny8cVp+LtJ0tpdu
         WuBTu9xvwl2HvqnQZqwcWluXc6HvIW7SHuqWx7OsRy+efnOPSzWfBlrB8pr2shoYyqZU
         C6v8+Nmc6Lt+FDtTFZnbDe29XnkgcNlopj72VyIx7kW5AqADWUMidHgEjedPD6xiyN/0
         6KFWrqEdHrsNTBnVGjvHMCKyu+2zvGMdueBIP06DVp+XmCdV2XDG7D4izLFnERvkRjw2
         tAVhlkVL5OugnNzfCYFC/YbKT6aBqAX/OrnWDyiuaLz2Ly9UpG3alfhyVy4MSjk1cpEW
         x47A==
X-Gm-Message-State: AJIora81zg8PG5IF65tDQB2SC9ieKB871l8pvzjNPg6T6Oxn1OnF8rv4
        svUBnjVo0qyNv4bO1eL+9SvVZ+rUs//h4Q==
X-Google-Smtp-Source: AGRyM1vyWN8zrLc24Su0EKYB0jx6L3i7Etd5MNZHPlZ1ByRW1bNWbuNtABUqkbaiylaTfO30/lyZ3w==
X-Received: by 2002:a67:e145:0:b0:354:3826:2548 with SMTP id o5-20020a67e145000000b0035438262548mr2717839vsl.77.1656248068315;
        Sun, 26 Jun 2022 05:54:28 -0700 (PDT)
Received: from mail-vs1-f42.google.com (mail-vs1-f42.google.com. [209.85.217.42])
        by smtp.gmail.com with ESMTPSA id s62-20020a1ff441000000b0036c54280ee5sm1040344vkh.8.2022.06.26.05.54.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jun 2022 05:54:27 -0700 (PDT)
Received: by mail-vs1-f42.google.com with SMTP id i186so6576322vsc.9;
        Sun, 26 Jun 2022 05:54:27 -0700 (PDT)
X-Received: by 2002:a05:6102:4ba:b0:355:3b13:daa2 with SMTP id
 r26-20020a05610204ba00b003553b13daa2mr2727071vsa.16.1656248067621; Sun, 26
 Jun 2022 05:54:27 -0700 (PDT)
MIME-Version: 1.0
References: <20220616060915.48325-1-samuel@sholland.org> <20220616060915.48325-4-samuel@sholland.org>
In-Reply-To: <20220616060915.48325-4-samuel@sholland.org>
Reply-To: wens@csie.org
From:   Chen-Yu Tsai <wens@csie.org>
Date:   Sun, 26 Jun 2022 20:54:16 +0800
X-Gmail-Original-Message-ID: <CAGb2v661t2aY35jaERC9stsEQ1TWKaMc63CW4pFnBayCF=Z7AA@mail.gmail.com>
Message-ID: <CAGb2v661t2aY35jaERC9stsEQ1TWKaMc63CW4pFnBayCF=Z7AA@mail.gmail.com>
Subject: Re: [PATCH 3/4] pinctrl: axp209: Support the AXP221/AXP223/AXP809 variant
To:     Samuel Holland <samuel@sholland.org>
Cc:     Lee Jones <lee.jones@linaro.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        devicetree <devicetree@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Thu, Jun 16, 2022 at 2:09 PM Samuel Holland <samuel@sholland.org> wrote:
>
> These PMICs each have 2 GPIOs with the same register layout as AXP813,
> but without an ADC function. They all fall back to the AXP221 compatible
> string, so only that one needs to be listed in the driver.
>
> Signed-off-by: Samuel Holland <samuel@sholland.org>

Reviewed-by: Chen-Yu Tsai <wens@csie.org>
