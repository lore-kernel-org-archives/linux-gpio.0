From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH] pinctrl: intel: wrap Intel pin control drivers in an
 architecture check
Date: Mon, 31 Jul 2017 16:48:57 +0300
Message-ID: <20170731134857.GU2369@lahna.fi.intel.com>
References: <20170704064947.10792-1-pbrobinson@gmail.com>
 <CACRpkdZL2iRF4Qo8rcFOg+9F1dTBj9RZ_49w=7h6P+8=d9BoYw@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga04.intel.com ([192.55.52.120]:40589 "EHLO mga04.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750987AbdGaNtd (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 31 Jul 2017 09:49:33 -0400
Content-Disposition: inline
In-Reply-To: <CACRpkdZL2iRF4Qo8rcFOg+9F1dTBj9RZ_49w=7h6P+8=d9BoYw@mail.gmail.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Peter Robinson <pbrobinson@gmail.com>, "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>

On Mon, Jul 31, 2017 at 03:41:16PM +0200, Linus Walleij wrote:
> On Tue, Jul 4, 2017 at 8:49 AM, Peter Robinson <pbrobinson@gmail.com> wrote:
> 
> > The Intel pin control drivers are architecture specific so add an if arch
> > to check for X86 or compile test to ensure continued test coverage.
> >
> > Cc: Mika Westerberg <mika.westerberg@linux.intel.com>
> > Cc: Heikki Krogerus <heikki.krogerus@linux.intel.com>
> > Signed-off-by: Peter Robinson <pbrobinson@gmail.com>
> 
> I'm waiting for Mika to say what he thinks about this. He's the overall
> Intel pin control maintainer.

Looks fine to me,

Acked-by: Mika Westerberg <mika.westerberg@linux.intel.com>
