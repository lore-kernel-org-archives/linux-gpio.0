From: Dan O'Donovan <dan@emutex.com>
Subject: Re: [PATCH 1/5] pinctrl: cherryview: convert bare unsigned to
 unsigned int
Date: Thu, 9 Jun 2016 17:04:04 +0100
Message-ID: <57599374.6030001@emutex.com>
References: <1464904543-4094-1-git-send-email-dan@emutex.com>
 <1464904543-4094-2-git-send-email-dan@emutex.com>
 <20160606102819.GU1743@lahna.fi.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from bert.emutex.com ([91.103.1.109]:32796 "EHLO bert.emutex.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751168AbcFIQEI (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
	Thu, 9 Jun 2016 12:04:08 -0400
In-Reply-To: <20160606102819.GU1743@lahna.fi.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mika Westerberg <mika.westerberg@linux.intel.com>
Cc: linus.walleij@linaro.org, heikki.krogerus@linux.intel.com, linux-gpio@vger.kernel.org

On 06/06/2016 11:28 AM, Mika Westerberg wrote:
> On Thu, Jun 02, 2016 at 10:55:39PM +0100, Dan O'Donovan wrote:
>> Addresses checkpatch warnings such as the following for this driver:
>>
>>  WARNING: Prefer 'unsigned int' to bare use of 'unsigned'
> I don't know if this is useful. Things like this make backporting real
> fixes harder. For new code, it makes sense but not for converting existing.
Fair point.  I'll drop that patch so in the next version.  Thanks!
> --
> To unsubscribe from this list: send the line "unsubscribe linux-gpio" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html

