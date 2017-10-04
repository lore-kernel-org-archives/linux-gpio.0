From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: cherryview: fix issues caused by dynamic gpio
 irqs mapping
Date: Wed, 4 Oct 2017 19:25:23 +0300
Message-ID: <20171004162523.GE2761@lahna.fi.intel.com>
References: <1507133254-5054-1-git-send-email-chrisjohgorman@gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:36333 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751148AbdJDQZi (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Wed, 4 Oct 2017 12:25:38 -0400
Content-Disposition: inline
In-Reply-To: <1507133254-5054-1-git-send-email-chrisjohgorman@gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Chris Gorman <chrisjohgorman@gmail.com>
Cc: linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org, Grygorii Strashko <grygorii.strashko@ti.com>

On Wed, Oct 04, 2017 at 12:07:34PM -0400, Chris Gorman wrote:
> Tested-by: Chris Gorman <chrisjohgorman@gmail.com>

I guess you sent this because of the "Tested-by", right? It is enough if
you reply to the original thread (the one posted by Grygorii yesterday)
and say something like:

  Works for me,
  Tested-by: ...

Then Linus W can add that tag to the patch when he applies it to his
tree.
