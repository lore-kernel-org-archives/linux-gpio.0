From: Mika Westerberg <mika.westerberg@linux.intel.com>
Subject: Re: [PATCH v2 1/3] firmware: dmi: Add DMI_PRODUCT_FAMILY
 identification string
Date: Thu, 1 Jun 2017 14:05:20 +0300
Message-ID: <20170601110520.GK2784@lahna.fi.intel.com>
References: <20170517102514.89744-1-mika.westerberg@linux.intel.com>
 <20170517102514.89744-2-mika.westerberg@linux.intel.com>
 <20170601112926.78fa218a@endymion>
 <20170601100940.GJ2784@lahna.fi.intel.com>
 <20170601125451.53173d35@endymion>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga06.intel.com ([134.134.136.31]:12384 "EHLO mga06.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751762AbdFALFb (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Thu, 1 Jun 2017 07:05:31 -0400
Content-Disposition: inline
In-Reply-To: <20170601125451.53173d35@endymion>
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Jean Delvare <jdelvare@suse.de>
Cc: Linus Walleij <linus.walleij@linaro.org>, Heikki Krogerus <heikki.krogerus@linux.intel.com>, Andy Shevchenko <andriy.shevchenko@linux.intel.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, Wei Yongjun <weiyongjun1@huawei.com>, bbaude@redhat.com, mildred-bug.kernel@mildred.fr, barnacs@justletit.be, lvuksta@gmail.com, linux-kernel@vger.kernel.org, linux-gpio@vger.kernel.org, Kelly French <kfrench@federalhill.net>

On Thu, Jun 01, 2017 at 12:54:51PM +0200, Jean Delvare wrote:
> On Thu, 1 Jun 2017 13:09:40 +0300, Mika Westerberg wrote:
> > On Thu, Jun 01, 2017 at 11:29:26AM +0200, Jean Delvare wrote:
> > > Hi all,
> > > 
> > > Sorry for the late reply.
> > > 
> > > On Wed, 17 May 2017 13:25:12 +0300, Mika Westerberg wrote:  
> > > > Sometimes it is more convenient to be able to match a whole family of
> > > > products, like in case of bunch of Chromebooks based on Intel_Strago to
> > > > apply a driver quirk instead of quirking each machine one-by-one.
> > > > 
> > > > This adds support for DMI_PRODUCT_FAMILY identification string and also
> > > > exports it to the userspace through sysfs attribute just like the
> > > > existing ones.  
> > > 
> > > dmidecode currently provides no direct access to this string. Do you
> > > think it should?  
> > 
> > Yeah, why not. I always just run "dmidecode" without any arguments and
> > that field is printed nicely among others :)
> 
> Correct. But I know many people out there use option -s for various
> purposes.

OK, I can send a patch adding it there.

> > > > (...)
> > > > diff --git a/drivers/firmware/dmi-id.c b/drivers/firmware/dmi-id.c
> > > > index 44c01390d035..dc269cb288c2 100644
> > > > --- a/drivers/firmware/dmi-id.c
> > > > +++ b/drivers/firmware/dmi-id.c
> > > > (...)
> > > > @@ -191,6 +192,7 @@ static void __init dmi_id_init_attr_table(void)
> > > >  	ADD_DMI_ATTR(product_version,   DMI_PRODUCT_VERSION);
> > > >  	ADD_DMI_ATTR(product_serial,    DMI_PRODUCT_SERIAL);
> > > >  	ADD_DMI_ATTR(product_uuid,      DMI_PRODUCT_UUID);
> > > > +	ADD_DMI_ATTR(product_family,      DMI_PRODUCT_FAMILY);  
> > > 
> > > Alignment, please!  
> > 
> > The patch is already applied and I suppose merged in v4.12-rc3+. Should
> > I send a fixup patch to fix this?
> 
> I will do it, no worry.
> 
> > > >  	ADD_DMI_ATTR(board_vendor,      DMI_BOARD_VENDOR);
> > > >  	ADD_DMI_ATTR(board_name,        DMI_BOARD_NAME);
> > > >  	ADD_DMI_ATTR(board_version,     DMI_BOARD_VERSION);
> > > > diff --git a/drivers/firmware/dmi_scan.c b/drivers/firmware/dmi_scan.c
> > > > index 54be60ead08f..93f7acdaac7a 100644
> > > > --- a/drivers/firmware/dmi_scan.c
> > > > +++ b/drivers/firmware/dmi_scan.c
> > > > @@ -430,6 +430,7 @@ static void __init dmi_decode(const struct dmi_header *dm, void *dummy)
> > > >  		dmi_save_ident(dm, DMI_PRODUCT_VERSION, 6);
> > > >  		dmi_save_ident(dm, DMI_PRODUCT_SERIAL, 7);
> > > >  		dmi_save_uuid(dm, DMI_PRODUCT_UUID, 8);
> > > > +		dmi_save_ident(dm, DMI_PRODUCT_FAMILY, 26);  
> > > 
> > > This field only exists since SMBIOS 2.4. For older implementations, you
> > > are accessing a random location of the DMI table. Most likely you'll
> > > hit a character in one of the strings associated with the system
> > > information structure. In turn this character will be interpreted as a
> > > DMI string number. With some luck, number will be >= 32, so you'll get
> > > a non-existent string and dmi_string will return "". But you could hit
> > > a string terminator (0) and return the 1st string of the structure
> > > instead (most likely the system manufacturer.)
> > > 
> > > Note that the problem is not specific to this field, it is just more
> > > likely to break because all other fields are defined by SMBIOS 2.0, or
> > > for the product UUID, SMBIOS 2.1. The fact that all dmi_save_*
> > > functions blindly assume that the structure is long enough to contain
> > > all the fields they want to save is problematic. This should be fixed
> > > separately.  
> > 
> > I see. Since you are more familiar with the DMI code, do you have time
> > to do that or should I try?
> 
> I'm already working on it.

Thanks!
