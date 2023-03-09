Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C5CB6C64EC4
	for <linux-gpio@archiver.kernel.org>; Thu,  9 Mar 2023 14:06:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230063AbjCIOG2 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 9 Mar 2023 09:06:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231599AbjCIOGF (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 9 Mar 2023 09:06:05 -0500
Received: from mail-yb1-xb29.google.com (mail-yb1-xb29.google.com [IPv6:2607:f8b0:4864:20::b29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C9B9CBE6
        for <linux-gpio@vger.kernel.org>; Thu,  9 Mar 2023 06:03:45 -0800 (PST)
Received: by mail-yb1-xb29.google.com with SMTP id v13so2077858ybu.0
        for <linux-gpio@vger.kernel.org>; Thu, 09 Mar 2023 06:03:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678370625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=rfLw2hJ09K7juhM7ToFdGQXgPnTRU+N2reGUNJs1fMk=;
        b=te5CmTZZaAREe6I9IbC5fP+cua4HnFYEfZjzKQLmEgXgfZVYTDH4bb328fgwm8hJdZ
         ASiGe0w+uRx9ZgsYg7fklWrSM2QC+cEPqkokwrRPDzH8CD+54vu1vE/BxGH64Vred9Nr
         Fvuky2dufM0aJY16tRiaVtupHqsK2ALSzEUOcecjwHCtjxKNTQ+6GMCxEIdpz/jV+iwz
         XEQsfxoWv/URUbKerklvhBjOWH35qUazvHwD2dqHQHY0GZmIoqBgNuDdvcoWBgY4d30U
         KHBq50GVm54ah6w0eLg0PCz14auugvv9pJzszHof3kyE8tjlCIRcr0xSfM6Lz7tw/kHq
         xVPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678370625;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=rfLw2hJ09K7juhM7ToFdGQXgPnTRU+N2reGUNJs1fMk=;
        b=4ZNwdy8JAGXt4hR2rCyMYg1pZ1Yu3oJ6uw1G3SG1Dr9kiRcw6Amu6cpNkEdYIRpG/4
         nr+yMEVhebXFrVacOqI7ZVd/Z/dgs0kNw2HMmWbic2f+cnvKa7k4LokpBwz2OhGj1EAe
         BW6DoeTm2el9ETuwENRhX7ByBVHml9HVZUfgatQgvheRWQxqNEViW3LA22Kss2oDm1qK
         /m6VQog6LRUifEgQqDvzWlARsC2eSzurjrDvI6YT80NsmkupBAGrWlcVmgxE43gw0qDN
         VZW/pyh/lZGnybA60xcsJKeSNkkTGnjUClHZjWAFSmvqhl0B3SnUlfiCy04U82FQVjIO
         13nw==
X-Gm-Message-State: AO0yUKV75Bb8OeTu/OIgWz2M0VdhB0gW5gCSDR2HnlVdmT9gCI/NpRE5
        seUMZYhiSsgP9RUYpmHd4Ob2lbuSfZkEiSDYScPp5Q==
X-Google-Smtp-Source: AK7set/V9g47LXb/8bVVYX4aEcUjsLMStk6C108ueaS9M+e5hKMWh6BL/B8P3j74SyJtKGeS1gB7pU0gGTbjZfKvQFQ=
X-Received: by 2002:a25:8c84:0:b0:b23:4649:7ef3 with SMTP id
 m4-20020a258c84000000b00b2346497ef3mr707871ybl.4.1678370624827; Thu, 09 Mar
 2023 06:03:44 -0800 (PST)
MIME-Version: 1.0
References: <20230308084309.396192-1-nm@ti.com>
In-Reply-To: <20230308084309.396192-1-nm@ti.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 9 Mar 2023 15:03:33 +0100
Message-ID: <CACRpkdbBWeFupRin=JuMCGDWkzbsR18N+4ZEbQOPJq=p3w0yLw@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: k3: Introduce debounce select mux macros
To:     Nishanth Menon <nm@ti.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, linux-gpio@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Tero Kristo <kristo@kernel.org>,
        Vignesh Raghavendra <vigneshr@ti.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 8, 2023 at 9:43 AM Nishanth Menon <nm@ti.com> wrote:

> Introduce the debounce select mux macros to allow folks to setup
> debounce configuration for pins. Each configuration selected maps
> to a specific timing register as documented in appropriate Technical
> Reference Manual (example:[1]).
>
> [1] AM625x TRM (section 6.1.2.2): https://www.ti.com/lit/pdf/spruiv7
> Signed-off-by: Nishanth Menon <nm@ti.com>

Patch applied.

Consider doing what Krzysztof recommends: move thes <dt-bindings/*.h>
down to the arch where you're using it and have them as .dtsi files instead
or something.

Yours,
Linus Walleij
