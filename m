From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: pinctrl: add AMD GPIO driver support.
Date: Fri, 20 Mar 2015 10:31:24 +0300
Message-ID: <20150320073124.GZ16501@mwanda>
References: <20150319160716.GA28850@mwanda>
 <4AC89B18A26BAB43B540DB1C94E2802C05B1C2E3@scybexdag03.amd.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from userp1040.oracle.com ([156.151.31.81]:47175 "EHLO
	userp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751380AbbCTHb2 (ORCPT
	<rfc822;linux-gpio@vger.kernel.org>); Fri, 20 Mar 2015 03:31:28 -0400
Content-Disposition: inline
In-Reply-To: <4AC89B18A26BAB43B540DB1C94E2802C05B1C2E3@scybexdag03.amd.com>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: "Xue, Ken" <Ken.Xue@amd.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>

On Fri, Mar 20, 2015 at 01:37:24AM +0000, Xue, Ken wrote:
> Hi Dan,
> Thanks.
> Can you tell me how to check this kind of warnings by myself, before I send the patches?
> I will send V4 patch for fixing warning.
> 

Sure.  :)

git clone git://repo.or.cz/smatch.git
cd smatch
make
cd ~/linux_src/
~/smatch/smatch_scripts/kchecker drivers/pinctrl/pinctrl-amd.c

regards,
dan carpenter

