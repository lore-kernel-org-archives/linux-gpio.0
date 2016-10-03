From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH 2/3] gpio: acpi: separation of concerns
Date: Mon, 3 Oct 2016 15:44:24 +0300
Message-ID: <20161003124424.GA1765@lahna.fi.intel.com>
References: <1475485360-15127-1-git-send-email-linus.walleij@linaro.org>
 <1475485360-15127-2-git-send-email-linus.walleij@linaro.org>
 <20161003102446.GA1218@lahna.fi.intel.com>
 <CACRpkdb_Owwei1vA2cwzcuuTOxVnyWJY1Q8yL4UVM8TdNb74+Q@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:15851 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751061AbcJCMo3 (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 3 Oct 2016 08:44:29 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb_Owwei1vA2cwzcuuTOxVnyWJY1Q8yL4UVM8TdNb74+Q@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, "Rafael J . Wysocki" <rafael.j.wysocki@intel.com>

On Mon, Oct 03, 2016 at 02:36:50PM +0200, Linus Walleij wrote:
> > -ENXIO?
> 
> Sorry for not writing all that I think.
> 
> The code works like such that if -ENOENT is returned, the core
> will proceed to check for presence of boardfile-type hardcoded
> descriptor tables. Which might be relevant.
> 
> (The mechanism should be used as fallback also when no
> desc is found in the ACPI lookup, actually.)

Makes sense. Thanks for the clarification.
