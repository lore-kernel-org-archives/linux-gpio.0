From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/1] pinctrl: baytrail: Add missing spinlock usage in
 byt_gpio_irq_handler
Date: Mon, 30 Jan 2017 13:51:49 +0200
Message-ID: <20170130115149.GM17297@lahna.fi.intel.com>
References: <20170130113528.17838-1-alexander.stein@systec-electronic.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:9219 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752821AbdA3LxR (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 30 Jan 2017 06:53:17 -0500
Content-Disposition: inline
In-Reply-To: <20170130113528.17838-1-alexander.stein@systec-electronic.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Alexander Stein <alexander.stein@systec-electronic.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Mon, Jan 30, 2017 at 12:35:28PM +0100, Alexander Stein wrote:
> According to VLI64 Intel Atom E3800 Specification Update (#329901)
> concurrent read accesses may result in returning 0xffffffff and write
> accesses may be dropped silently.
> To workaround all accesses must be protected by locks.
> 
> Signed-off-by: Alexander Stein <alexander.stein@systec-electronic.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Should probably go to stable as well.
