From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: limit Strago DMI workarounds to
 version 1.0
Date: Tue, 28 Nov 2017 21:29:47 +0200
Message-ID: <20171128192947.GI22431@lahna.fi.intel.com>
References: <20171128191435.uxftu3bl4x4f2fxi@dtor-ws>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga09.intel.com ([134.134.136.24]:55987 "EHLO mga09.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752654AbdK1T3v (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 28 Nov 2017 14:29:51 -0500
Content-Disposition: inline
In-Reply-To: <20171128191435.uxftu3bl4x4f2fxi@dtor-ws>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>
Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Guenter Roeck <linux@roeck-us.net>, linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 28, 2017 at 11:14:35AM -0800, Dmitry Torokhov wrote:
> As Google/Intel will fix the BIOS/Coreboot issues with hardcoding
> virtual interrupt numbers for keyboard/touchpa/touchscreen controllers
> in ACPI tables, they will also update BIOS version number from 1.0
> to 1.1. Let's limit the DMI quirks that try to preserve virtual IRQ
> numbers on Strago boards to those that still carry BIOSes 1.0.
> 
> Bugzilla: https://bugzilla.kernel.org/show_bug.cgi?id=197953
> Signed-off-by: Dmitry Torokhov <dmitry.torokhov@gmail.com>

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>

Assuming there is no version "0.9" or so having the same issue.
