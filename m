Return-Path: <linux-gpio-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E15DFEB64DA
	for <linux-gpio@archiver.kernel.org>; Wed, 12 Jul 2023 15:29:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231592AbjGLP3U (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Wed, 12 Jul 2023 11:29:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46080 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229843AbjGLP3S (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Wed, 12 Jul 2023 11:29:18 -0400
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F05001BF6;
        Wed, 12 Jul 2023 08:28:46 -0700 (PDT)
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="345232142"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="345232142"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 12 Jul 2023 08:28:46 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10769"; a="845700278"
X-IronPort-AV: E=Sophos;i="6.01,200,1684825200"; 
   d="scan'208";a="845700278"
Received: from smile.fi.intel.com ([10.237.72.54])
  by orsmga004.jf.intel.com with ESMTP; 12 Jul 2023 08:28:42 -0700
Received: from andy by smile.fi.intel.com with local (Exim 4.96)
        (envelope-from <andy@kernel.org>)
        id 1qJblg-002AFD-33;
        Wed, 12 Jul 2023 18:28:40 +0300
Date:   Wed, 12 Jul 2023 18:28:40 +0300
From:   Andy Shevchenko <andy@kernel.org>
To:     Serge Semin <fancer.lancer@gmail.com>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Hoan Tran <hoan@os.amperecomputing.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <brgl@bgdev.pl>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>, linux-gpio@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: gpio: snps,dw-apb: allow gpio-line-names
Message-ID: <ZK7GqJlXhCIcA/J2@smile.fi.intel.com>
References: <20230712074553.35907-1-krzysztof.kozlowski@linaro.org>
 <d25vlma6vefztgggatas7ipn36rumhuodzcalfq7c6apwliy7a@ddgo3fgulv2s>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d25vlma6vefztgggatas7ipn36rumhuodzcalfq7c6apwliy7a@ddgo3fgulv2s>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Wed, Jul 12, 2023 at 12:53:00PM +0300, Serge Semin wrote:
> On Wed, Jul 12, 2023 at 09:45:53AM +0200, Krzysztof Kozlowski wrote:
> > Allow the GPIO controller subnode to define GPIO names.

Are we going to do this for each GPIO controller bindings? Can it be done once
for all please?

-- 
With Best Regards,
Andy Shevchenko


