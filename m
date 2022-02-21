Return-Path: <linux-gpio-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 90A94C433EF
	for <linux-gpio@archiver.kernel.org>; Mon, 21 Feb 2022 15:29:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1349219AbiBUP32 (ORCPT <rfc822;linux-gpio@archiver.kernel.org>);
        Mon, 21 Feb 2022 10:29:28 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1356477AbiBUP3Z (ORCPT
        <rfc822;linux-gpio@vger.kernel.org>); Mon, 21 Feb 2022 10:29:25 -0500
Received: from mga17.intel.com (mga17.intel.com [192.55.52.151])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6378220E9;
        Mon, 21 Feb 2022 07:29:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1645457342; x=1676993342;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=KbSp/teu1GK16ew77EjvfNtP5gerVHwaaYi2wsE3vIo=;
  b=hkS54PJ2d5NpW/uyUyCEg1yOnIKbdRec/HShMcAQBp9rdrBOPxCKwn2H
   wM1eh29w6wE1WAWITY6ASYnubgPXFfr7pscPCDQtafSnpZUVWpCETqslP
   eQWXFCb/lWYFvtd3Evd/FhKAi0dnLhiIPmthuIGy/g+X3gD9mmDGe856e
   e9zwRSnW4Oos7gv6NQDvm83SCWSivW0rG4xDkhI5sNYfsDM3YOJosaQJo
   y2+a+4WMUJbT6ETUMEYx+sBjKWT+LaB4FtFTah7rOfqmusie4irw3KEmZ
   PsoKxZlGS13a3gdbI+JBo2tmKknUa6Ii6+AgmUp5ILaEfIRclMhWSta0+
   A==;
X-IronPort-AV: E=McAfee;i="6200,9189,10265"; a="232147670"
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="232147670"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by fmsmga107.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 07:29:02 -0800
X-IronPort-AV: E=Sophos;i="5.88,386,1635231600"; 
   d="scan'208";a="638585960"
Received: from lahna.fi.intel.com (HELO lahna) ([10.237.72.162])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Feb 2022 07:28:59 -0800
Received: by lahna (sSMTP sendmail emulation); Mon, 21 Feb 2022 17:28:56 +0200
Date:   Mon, 21 Feb 2022 17:28:56 +0200
From:   Mika Westerberg <mika.westerberg@linux.intel.com>
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org,
        Andy Shevchenko <andy@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v1 4/4] pinctrl: icelake: Add Ice Lake-N PCH pin
 controller support
Message-ID: <YhOvuFwr2v15zY3u@lahna>
References: <20220215152800.21104-1-andriy.shevchenko@linux.intel.com>
 <20220215152800.21104-4-andriy.shevchenko@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220215152800.21104-4-andriy.shevchenko@linux.intel.com>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
Precedence: bulk
List-ID: <linux-gpio.vger.kernel.org>
X-Mailing-List: linux-gpio@vger.kernel.org

On Tue, Feb 15, 2022 at 05:28:00PM +0200, Andy Shevchenko wrote:
> This adds pinctrl/GPIO support for Intel Ice Lake-N PCH. The Ice Lake-N
> PCH GPIO is based on the same version of the Intel GPIO hardware than
> Intel Cannon Lake with different set of pins and ACPI ID.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
