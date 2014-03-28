From: Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH] gpio-lynxpoint: force gpio_get() to return "1" and "0" only
Date: Fri, 28 Mar 2014 21:53:02 +0100
Message-ID: <CACRpkdZBRSz_5bZhoiqS=qgCFR7aZP-P_3MVfvUbeGqc0aJGrA@mail.gmail.com>
References: <1395925328-6056-1-git-send-email-mathias.nyman@linux.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mail-oa0-f47.google.com ([209.85.219.47]:54278 "EHLO
	mail-oa0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752572AbaC1UxD (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 28 Mar 2014 16:53:03 -0400
Received: by mail-oa0-f47.google.com with SMTP id i11so6683898oag.20
        for <linux-gpio@vger.kernel.org>; Fri, 28 Mar 2014 13:53:02 -0700 (PDT)
In-Reply-To: <1395925328-6056-1-git-send-email-mathias.nyman@linux.intel.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Mathias Nyman <mathias.nyman@linux.intel.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Thu, Mar 27, 2014 at 2:02 PM, Mathias Nyman
<mathias.nyman@linux.intel.com> wrote:

> Don't return the IN_LVL_BIT directly, a high gpio line returned
> value "1073741824" intestead of "1" because IN_LVL_BIT is BIT(30)
>
> Tested-by: Jerome Blin <jerome.blin@intel.com>
> Signed-off-by: Mathias Nyman <mathias.nyman@linux.intel.com>

Patch applied.

Yours,
Linus Walleij
