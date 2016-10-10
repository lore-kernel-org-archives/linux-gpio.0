From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: Only restore pins that are used by the
 driver
Date: Mon, 10 Oct 2016 17:53:46 +0300
Message-ID: <20161010145346.GI30800@lahna.fi.intel.com>
References: <CAFv23Q=_wSqhBE9ni9YmtxyEKFSENLYZ512Ent9iyWd7hv3gYg@mail.gmail.com>
 <20161010133931.88055-1-mika.westerberg@linux.intel.com>
 <0e3bf0b8c82d4c3ca6d753abfd1063bf@ausx13mpc124.AMER.DELL.COM>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga03.intel.com ([134.134.136.65]:42336 "EHLO mga03.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753067AbcJJPCj (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 10 Oct 2016 11:02:39 -0400
Content-Disposition: inline
In-Reply-To: <0e3bf0b8c82d4c3ca6d753abfd1063bf@ausx13mpc124.AMER.DELL.COM>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mario.Limonciello@dell.com
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, acelan.kao@canonical.com, linux.cj@gmail.com, Jared.Dominguez@dell.com, linux-gpio@vger.kernel.org

On Mon, Oct 10, 2016 at 02:37:19PM +0000, Mario.Limonciello@dell.com wrote:
> After positive comments in this working properly and is accepted, would you 
> consider submitting back to @stable as well?  It affects all kernel versions 
> that carry intel pinctrl (IIRC back to 4.1?)

Sure.

LinusW, this should have stable tag starting from v4.1. Let me know if
you want me to re-submit the patch.
