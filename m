From: Jon Masters <jcm@jonmasters.org>
Subject: Re: [PATCH] pinctrl: intel: add blacklist list for XPS machines
Date: Wed, 12 Oct 2016 12:31:53 -0400
Message-ID: <0a0ad82d-dfef-95da-7b8e-6b045a151270@jonmasters.org>
References: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41856 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755628AbcJLQdK (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 12 Oct 2016 12:33:10 -0400
In-Reply-To: <1475647025-25617-1-git-send-email-acelan.kao@canonical.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: AceLan Kao <acelan.kao@canonical.com>, Mika Westerberg <mika.westerberg@linux.intel.com>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Linus Walleij <linus.walleij@linaro.org>, linux-gpio@vger.kernel.org
Cc: Mario.Limonciello@dell.com

On 10/05/2016 01:57 AM, AceLan Kao wrote:

> The touchscreen on some Dell machines stop working after
> closing and opening the lid after this driver is introduced.
> So, I add a dmi list to black out those machines that doesn't
> work well with this driver.

Woot! This fixes the problems I've been having with the touchscreen on
my 2016 SKL XPS 13 :) Thanks to Mario for the head's up!

Jon.

-- 
Computer Architect
