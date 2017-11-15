From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: save HOSTSW_OWN register over
 suspend/resume
Date: Wed, 15 Nov 2017 12:13:02 +0200
Message-ID: <20171115101302.GA17200@lahna.fi.intel.com>
References: <20171114104136.25595-1-chiu@endlessm.com>
 <20171115080446.GY17200@lahna.fi.intel.com>
 <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:25908 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S935141AbdKPN5w (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 16 Nov 2017 08:57:52 -0500
Content-Disposition: inline
In-Reply-To: <018180A5-B0D2-418E-9DBC-EF5F310F7295@endlessm.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Chiu <chiu@endlessm.com>
Cc: heikki.krogerus@linux.intel.com, linus.walleij@linaro.org, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, linux@endlessm.com

On Wed, Nov 15, 2017 at 04:08:32PM +0800, Chris Chiu wrote:
>     Yes, that’s the most weird part.

Sounds pretty much like a BIOS issue. Do you know if there is a newer
BIOS and have you tried that already?
