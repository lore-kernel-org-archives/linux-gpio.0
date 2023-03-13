Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97956C61DA4
	for <linux-gpio@archiver.kernel.org>; Mon, 13 Mar 2023 10:24:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229694AbjCMKYd (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 13 Mar 2023 06:24:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbjCMKYL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 13 Mar 2023 06:24:11 -0400
Received: from mail-yw1-x1134.google.com (mail-yw1-x1134.google.com [IPv6:2607:f8b0:4864:20::1134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A14A224BF0
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:24:09 -0700 (PDT)
Received: by mail-yw1-x1134.google.com with SMTP id 00721157ae682-5416b0ab0ecso102947007b3.6
        for <linux-gpio@vger.kernel.org>; Mon, 13 Mar 2023 03:24:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678703049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=+EtJ3bUB6vUCegzY8eIMKjQxrxoKTCdPqy41DuEhXLE=;
        b=GSi9d14eTuVck+DGZLDOl63Y51TtVhhZjWUQWcCnVi3zr1AYPo8L0/DphDYN9PAspw
         FS7unWqqmXlc6g5nlt9sc5zJoXHb0QJ3sKamAc70qCyUlxYzX3HvT2CiCK6Q61DvpSWw
         psZp0stjXefil92FUBy3DMXoGzKOkoeYyyXAt1gsQLQ78Gf7Tu8sKivg9C0ZVdDemtPQ
         JmP+mgc4wiMMxkE10Aglz+klIzXJSaq5mddSKHQsbt6WQOEImAa8gTI23Wa90sZmKRoe
         TuJ15t2qMLisYM2zGWc3OnuWaHgsWh0jjgJGAikh6YtKmuIxRDUT86jCrZw6e7JvMBbY
         pQfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678703049;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+EtJ3bUB6vUCegzY8eIMKjQxrxoKTCdPqy41DuEhXLE=;
        b=1srAGM7TgukLlsbLoGpNAKH7eqKptpnKevWZx9TyTbu0vJZa0XXQ5gIn5ODpiNn7VB
         Lr68dRP2bDDCHrjZiBc94h/9LLVy/b0Na91wQ1T667q+qNojXiwWZOP7E3P92Q0k97Iu
         NnBUhkzzN45kwfg+fpTKlu2pEp3y/7B7M4fLNEzRq6ks2cIXmzeke5rxxwrduRtLf/Ry
         oN0gCpc7qmhM7bZFE2DakgfbIoiQits9wKs0LGUgC13ZmM6DOywpFc08Ie+p0mKO40Sb
         djp+xV0NeOXeKrW3H+ecxB/FghqHzViUiymaAi5OP0gR2YF+NqJQdfPPX9qXLnzNs0RJ
         GPWg==
X-Gm-Message-State: AO0yUKVN1uIemQiphRjsw+6VxjWzdXEUrUJkcTLYcKzJvYYGU7zfUDhf
        C8kQTkm/PHzTXWD2HNPLdZmQse8MGA3vlzjYSWqyrw==
X-Google-Smtp-Source: AK7set81IySMbIhcp2Fp0qxELomKcOXvhsf9cROpbwZ7dJv/PRuH/dQq9bGa3FPnaqTfcFLdORfxcr7MsfLiyyuQDHs=
X-Received: by 2002:a81:ac51:0:b0:540:b6c9:66cd with SMTP id
 z17-20020a81ac51000000b00540b6c966cdmr5507916ywj.10.1678703048864; Mon, 13
 Mar 2023 03:24:08 -0700 (PDT)
MIME-Version: 1.0
References: <20230308213651.647098-1-konrad.dybcio@linaro.org>
In-Reply-To: <20230308213651.647098-1-konrad.dybcio@linaro.org>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Mon, 13 Mar 2023 11:23:57 +0100
Message-ID: <CACRpkdZFWaLZvD6uW6rO+oKGZw24S+dKD+TBBpkQJKceiSBnaw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: qcom: msm8998: Add MPM pin mappings
To:     Konrad Dybcio <konrad.dybcio@linaro.org>
Cc:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, marijn.suijten@somainline.org,
        linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Mar 8, 2023 at 10:36 PM Konrad Dybcio <konrad.dybcio@linaro.org> wrote:

> Add MPM <-> TLMM pin mappings to allow for waking up the AP from sleep
> through MPM-connected pins.
>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>

Patch applied as nonurgent fix, tell me if it should rather be treated as
urgent (for the -rc:s and/or stable tags)

Yours,
Linus Walleij
