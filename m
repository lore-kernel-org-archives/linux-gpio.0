Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C48EC7EE25
	for <linux-gpio@archiver.kernel.org>; Thu,  8 Jun 2023 13:50:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229753AbjFHNuN (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 8 Jun 2023 09:50:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34548 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234860AbjFHNuL (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 8 Jun 2023 09:50:11 -0400
Received: from mail-yw1-x1132.google.com (mail-yw1-x1132.google.com [IPv6:2607:f8b0:4864:20::1132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0DA5269F
        for <linux-gpio@vger.kernel.org>; Thu,  8 Jun 2023 06:50:05 -0700 (PDT)
Received: by mail-yw1-x1132.google.com with SMTP id 00721157ae682-565a022ef06so5387057b3.3
        for <linux-gpio@vger.kernel.org>; Thu, 08 Jun 2023 06:50:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686232205; x=1688824205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=J8QpnJSVLjkLfqhjKetMXB1z/ynBlgTXzzXr8NIKQBg=;
        b=eoeJediBHOzQ4sCzvkREN7NkrM+aOyYC9wrM0BBnD9QxoBLoy5vPtbG+E2gPKOhIwu
         EyNOe2N8inNUgS6tjtZnWsksbeCvcU8AoFBZ6DobK57j0QMubICD10enZz9lOfMoiZto
         dnEvHA8rWj9ZLoqv3YvVr4raYrYLM79xqk8YTt2cbBiEZAPfbmHKLO3XZuEbr0szb/95
         SsCYDLUHDN/89usT82gCPbSachy3FrjGTVQM2qjW2EJ9uSXC3cX2taX/RguroKB4gpOF
         aOvxH6ic6qAbhoKc4/toPBBjaozoEySEUg2T2tBycGzEMbSPSZvDTUa9JAlMnTpiNlUU
         uJtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686232205; x=1688824205;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=J8QpnJSVLjkLfqhjKetMXB1z/ynBlgTXzzXr8NIKQBg=;
        b=ITv2eQ3KEnw+eWnestT9ovk+kdeFzhem7xOt7dC3znMnUJ755wmq3KfMJ+SRhwYE+A
         0K4staLFUmpqC2a61LZlChWNlXHUa6EsNx2A4zWazfqu6L0LvOwm0yaLPmQ693u81SA9
         Tloxx5tB6geGBw67nk6O2MHmb0tJcKg5garg3udp2YgacvBvbH9LcL9EHaHKEM62uyDo
         xmeq9/FkFohiYnXnKrat7RvAmPrcKtkF3IOk/IjDhy7+YT75yWy+yYUREi0FWjQ4mcp/
         RTXG8XEZ/FoW/AOUPCq1ahw1+aOZ2w4oG5LI7lJWGvzyrsTK3pjbYTPDX2rRGPjD90Cr
         KC+A==
X-Gm-Message-State: AC+VfDyANdLC6jW0X7WAqu2hvDLFYJ/DaQsBmRuTPvziXRSUEfNsXymI
        q8qEEPbmDD8xHxhUDIPSpDDOzbuTqWzmhsJcYaflPw==
X-Google-Smtp-Source: ACHHUZ7B7bXPRaT8K13It0iwZz1KqJEF7lXGqjS4rO8Dx3uKOw8HQryytQq7nhVtQCV6nX83IX6Uwme+LOGCLFP0Fx4=
X-Received: by 2002:a81:6a87:0:b0:568:fe3a:46b3 with SMTP id
 f129-20020a816a87000000b00568fe3a46b3mr10251209ywc.28.1686232205112; Thu, 08
 Jun 2023 06:50:05 -0700 (PDT)
MIME-Version: 1.0
References: <20230602132859.16442-1-alexandre.torgue@foss.st.com> <20230602132859.16442-3-alexandre.torgue@foss.st.com>
In-Reply-To: <20230602132859.16442-3-alexandre.torgue@foss.st.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 8 Jun 2023 15:49:54 +0200
Message-ID: <CACRpkdahyWFFscLYTDBGGSp-67_+4Qj1dsDif-jDFWoEK0mXzw@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] pinctrl: stm32: add stm32mp257 pinctrl support
To:     Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Conor Dooley <conor+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
        Olof Johansson <olof@lixom.net>, soc@kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Fri, Jun 2, 2023 at 3:29=E2=80=AFPM Alexandre Torgue
<alexandre.torgue@foss.st.com> wrote:

> Add stm32mp257 pinctrl support.
>
> Signed-off-by: Alexandre Torgue <alexandre.torgue@foss.st.com>

Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Please merge the whole series through ARM SoC with my ACK.

Yours,
Linus Walleij
