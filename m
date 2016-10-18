From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Tue, 18 Oct 2016 15:46:39 +0300
Message-ID: <20161018124639.GD1722@lahna.fi.intel.com>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
 <CACRpkdb5qT2E+pm72g55hZYEmQQGPtNi-2UOQFY48X+Ecw=MUw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:44997 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755122AbcJRMqo (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Tue, 18 Oct 2016 08:46:44 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdb5qT2E+pm72g55hZYEmQQGPtNi-2UOQFY48X+Ecw=MUw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: AceLan Kao <acelan.kao@canonical.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Oct 18, 2016 at 02:43:25PM +0200, Linus Walleij wrote:
> On Wed, Oct 5, 2016 at 7:57 AM, AceLan Kao <acelan.kao@canonical.com> wrote:
> 
> > The touchscreen on some Dell machines stop working after
> > closing and opening the lid after this driver is introduced.
> > So, I add a dmi list to black out those machines that doesn't
> > work well with this driver.
> >
> > Signed-off-by: AceLan Kao <acelan.kao@canonical.com>
> 
> Is this patch still needed after Mika's thorough fix?
> 
> I guess not?

It's not needed anymore.
