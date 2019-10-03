Return-Path: <SRS0=R7Pu=X4=vger.kernel.org=linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 533C6C10F14
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Oct 2019 10:19:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2D48D218DE
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Oct 2019 10:19:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BiohckBc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727242AbfJCKT6 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 3 Oct 2019 06:19:58 -0400
Received: from mail-lj1-f193.google.com ([209.85.208.193]:46080 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726978AbfJCKT6 (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Oct 2019 06:19:58 -0400
Received: by mail-lj1-f193.google.com with SMTP id d1so2034476ljl.13
        for <linux-gpio@vger.kernel.org>; Thu, 03 Oct 2019 03:19:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Mx2mVdBYrakYmKxbPV66SmuQcwBPBGOoE53tUIGHR+A=;
        b=BiohckBckv+eDTVkHIyBC8N7T6XQTXFT0oc1lxYcBVidzoZVAV7lN2qPws75YjQJom
         1CmWc86k3OXNMIg+KGYFkKk6WH1jJwJc3SKei1E2Yu4AzBDEcm4ZJXgtKbt6RVaUVznD
         CdfVW6NE3SjiWU+htl7iwmSSKUfC2xcuX9HoxBnoxGakn5KIslygdNV1woIbSjwhXpmv
         91FSZG18vyp7hlyJqI11V2Tq/w5eEMXw+EWwG8DfaGipdHvG4Rwibr4fPOk7D9XW71ox
         zmuEvTjefK87JRBKNAkHvnOPRBXGTu0uuHxeMbPjuuH67AfuFHpc7T0oayvOk58CB8C0
         L8IA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Mx2mVdBYrakYmKxbPV66SmuQcwBPBGOoE53tUIGHR+A=;
        b=iscDm1e2FYDMcaqLCGD4OELK8oeFLjoWKrep/o27Tf/tGW2xSgyeE4dPq7sojnsvAo
         0TutSIBFVlp8LRYVQ0KzCZov/iXvdA6Ws3nt7Szt9Qd0V17eYnYMvbdPCN+NnywylnHe
         bUzuV/7OKrEgCZZufWeqDv0/opuK54nnh9gPFjo7Uv+bspK2XrALmTOt1HEkxNCYchNz
         9jRkgiPzvLVXUzzJn1vUDfmPe1vX6IRlCgqRXePRsnFzSKfQ/EZhhn+wRhxzeQhquV7L
         CGpSKC3WdkjmNf5UK5mtyoghtxttd83gw8qTWvY8p8syLBBvfs3hzCyXF+Rnex+3s2gA
         d98A==
X-Gm-Message-State: APjAAAUM5sBrTkfYt599Kh2AH3QqN47X3RZ8Fuubqebm3o3OygkUh7cM
        uqgEQIBBvRTO/Bj9o+sCTuH6lzECm9/IrGf3KVW2VA==
X-Google-Smtp-Source: APXvYqxtEBgA75ZlWizzadlM7ku6Sc5eWq/YvW5BJWg+JWNU8Jj6xHbXWXCZZexLY3SRjk7ikjV1/YWyZXiTaMlU0qU=
X-Received: by 2002:a2e:63da:: with SMTP id s87mr5494745lje.79.1570097994932;
 Thu, 03 Oct 2019 03:19:54 -0700 (PDT)
MIME-Version: 1.0
References: <20190927031551.20074-1-hui.song_1@nxp.com>
In-Reply-To: <20190927031551.20074-1-hui.song_1@nxp.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 3 Oct 2019 12:19:42 +0200
Message-ID: <CACRpkdZh80H+G43-y0AGXJo0p=C5YADZBu3h1v2-3LvLj_Z=aQ@mail.gmail.com>
Subject: Re: [PATCH v6] gpio/mpc8xxx: change irq handler from chained to normal
To:     Hui Song <hui.song_1@nxp.com>
Cc:     Shawn Guo <shawnguo@kernel.org>, Li Yang <leoyang.li@nxp.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-gpio-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Sep 27, 2019 at 5:26 AM Hui Song <hui.song_1@nxp.com> wrote:

> From: Song Hui <hui.song_1@nxp.com>
>
> More than one gpio controllers can share one interrupt, change the
> driver to request shared irq.
>
> While this will work, it will mess up userspace accounting of the number
> of interrupts per second in tools such as vmstat.  The reason is that
> for every GPIO interrupt, /proc/interrupts records the count against GIC
> interrupt 68 or 69, as well as the GPIO itself.  So, for every GPIO
> interrupt, the total number of interrupts that the system has seen
> increments by two
>
> Signed-off-by: Laurentiu Tudor <Laurentiu.Tudor@nxp.com>
> Signed-off-by: Alex Marginean <alexandru.marginean@nxp.com>
> Signed-off-by: Song Hui <hui.song_1@nxp.com>
> ---
>  Changes in v6:
>         - change request_irq to devm_request_irq and add commit message

There is some build error on the patch, can you look into it?

Yours,
Linus Walleij
