Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0049C433EF
	for <linux-gpio@archiver.kernel.org>; Thu,  3 Mar 2022 05:52:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229728AbiCCFwy (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Thu, 3 Mar 2022 00:52:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229726AbiCCFwy (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Thu, 3 Mar 2022 00:52:54 -0500
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7E038163D76
        for <linux-gpio@vger.kernel.org>; Wed,  2 Mar 2022 21:52:08 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id t11so6064247wrm.5
        for <linux-gpio@vger.kernel.org>; Wed, 02 Mar 2022 21:52:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=date:from:to:cc:subject:message-id:reply-to:references:mime-version
         :content-disposition:in-reply-to;
        bh=fUvJ1FGslA5WYPriiaq2+k+CtDHNYAOxNSXhjt3sp7E=;
        b=QZr291mCokW7MzTSGdl2fadqzKN8rxrf/dmH1T2zr0agKMQqOJJtysLQqK+TTGnIBe
         h7uXHXfm4Nwagul4Zr6B+gNJEEzdwZQQyONFk1lNMK3fIl5aZ2miKG6NhRvzeytDg3bF
         Lv8Ty3692g+vj9NAt/rCHtAUPn7F4bqVr96ny7AT75P8QRNGu2ySJD7FT8/8BcL5NW9a
         hvqhPG0sx8xlAQba+s9cysmEG/3pF/fPlzoVsTZm1iFep1odleHDX7jK+KxYlVFCAk1N
         jBW7XpNHgq5hR/jgtiJ16H4Np+ADWJlq22CTSnRwLxmPDTEF/ztacm3O9ep6IgTgM5Lc
         PC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:reply-to
         :references:mime-version:content-disposition:in-reply-to;
        bh=fUvJ1FGslA5WYPriiaq2+k+CtDHNYAOxNSXhjt3sp7E=;
        b=tSYQreo6UbJPIjpLHavKOPfpfwfuMb0UJmgzLF3j8gxTFqjAI9C1Rrimhwf1jcW5Tm
         8xU7BY5ahqSki0KJ+6z3f3GHQ0xXSgeIoENgtBJJRaPU3Uh4IHym5CnyQUsR7p3FhaUJ
         QA6xkI5g4N4clqr5kDef8aY/IlJIMy6jnw4VUWfubsOITPQyHlZ+AA5y5ULJKUNaBgXf
         E4LF82NESVJji0bUT4CrolEGY8xsT13h3dCYOJsDOgGSVDax0+8ukperPp3hmSww3XRV
         7lwlpx23haQyDyCqUawwG/geotqJ1OrWbKn2B5EH0tQv5a2DMwc7uwv/mV2AAvVBThVU
         Z2wg==
X-Gm-Message-State: AOAM532VebIkZM5CsFHs5oCA+nvDBnSe+n46WduauhbwAeHH/Su9LHYQ
        V3lphjARUr1OqZrM0WhXoJA=
X-Google-Smtp-Source: ABdhPJzKD6/TCvoRQhEUEmZxwgK3h/XwImRnSsHs96EOx80rEH13qgqPIiUbYiwxdBZnbxGlrCclbA==
X-Received: by 2002:a05:6000:1847:b0:1e6:2783:b3e6 with SMTP id c7-20020a056000184700b001e62783b3e6mr25371263wri.163.1646286727005;
        Wed, 02 Mar 2022 21:52:07 -0800 (PST)
Received: from pevik (gw1.ms-free.net. [185.243.124.10])
        by smtp.gmail.com with ESMTPSA id u23-20020a7bcb17000000b0037bdfa1665asm10299361wmj.18.2022.03.02.21.52.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Mar 2022 21:52:06 -0800 (PST)
Date:   Thu, 3 Mar 2022 06:52:01 +0100
From:   Petr Vorel <petr.vorel@gmail.com>
To:     Weiguo Li <liwg06@foxmail.com>
Cc:     andrew@aj.id.au, linux-gpio@vger.kernel.org,
        linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH] pinctrl: aspeed: fix null dereference in debug
Message-ID: <YiBXgV4mVYiJ2MxQ@pevik>
Reply-To: Petr Vorel <petr.vorel@gmail.com>
References: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <tencent_BBDF8D2C89ECC450F3349D6E46F8EAF87F0A@qq.com>
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

Hi Weiguo,

LGTM.
Reviewed-by: Petr Vorel <pvorel@suse.cz>

Kind regards,
Petr
