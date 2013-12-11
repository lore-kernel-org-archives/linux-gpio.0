From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCHv4] ARM: tegra: add gpiod_lookup table for paz00
Date: Wed, 11 Dec 2013 12:51:03 +0100
Message-ID: <CACRpkdb0f_8Mu-iN1OEe=uiNxTbY1VJqY7nWuEY3AJMtjXHFnw@mail.gmail.com>
References: <1385460350-17543-2-git-send-email-mika.westerberg@linux.intel.com>
	<1386074998-17833-1-git-send-email-heikki.krogerus@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-ob0-f175.google.com ([209.85.214.175]:61967 "EHLO
	mail-ob0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751379Ab3LKLvF (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Wed, 11 Dec 2013 06:51:05 -0500
Received: by mail-ob0-f175.google.com with SMTP id uz6so6788307obc.34
        for <linux-gpio@vger.kernel.org>; Wed, 11 Dec 2013 03:51:03 -0800 (PST)
In-Reply-To: <1386074998-17833-1-git-send-email-heikki.krogerus@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Heikki Krogerus <heikki.krogerus@linux.intel.com>
Cc: Mika Westerberg <mika.westerberg@linux.intel.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Chris Ball <cjb@laptop.org>, Johannes Berg <johannes@sipsolutions.net>, Rhyland Klein <rklein@nvidia.com>, Adrian Hunter <adrian.hunter@intel.com>, Alexandre Courbot <acourbot@nvidia.com>, Mathias Nyman <mathias.nyman@linux.intel.com>, Rob Landley <rob@landley.net>, Stephen Warren <swarren@wwwdotorg.org>, Thierry Reding <thierry.reding@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Tue, Dec 3, 2013 at 1:49 PM, Heikki Krogerus
<heikki.krogerus@linux.intel.com> wrote:

> This makes it possible to request the gpio descriptors in
> rfkill_gpio driver regardless of the platform.
>
> Signed-off-by: Heikki Krogerus <heikki.krogerus@linux.intel.com>

Applied this v4 version to the devel branch in the GPIO tree with
Stephen's ACK, thanks!

Yours,
Linus Walleij
