From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Wed, 5 Oct 2016 11:55:02 +0300
Message-ID: <20161005085502.GY1765@lahna.fi.intel.com>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
 <CAEhpT-WvLqfzfxrsRB_+tifq4tESnz_HqdaFb=0VUjff2=3-mg@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:60850 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751479AbcJEJDx (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 5 Oct 2016 05:03:53 -0400
Content-Disposition: inline
In-Reply-To: <CAEhpT-WvLqfzfxrsRB_+tifq4tESnz_HqdaFb=0VUjff2=3-mg@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Calvin Johnson <linux.cj@gmail.com>
Cc: AceLan Kao <acelan.kao@canonical.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org

On Wed, Oct 05, 2016 at 01:27:31PM +0530, Calvin Johnson wrote:
> On Wed, Oct 5, 2016 at 11:27 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> > The touchscreen on some Dell machines stop working after
> > closing and opening the lid after this driver is introduced.
> > So, I add a dmi list to black out those machines that doesn't
> > work well with this driver.
> 
> Why don't you find out what in the driver is causing this problem,
> instead of avoiding the driver  loading altogether?

Exactly!
