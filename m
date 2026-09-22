Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CBB1253A38B;
	Tue, 22 Sep 2026 11:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790075853; cv=none; b=KMiReOVNBhgYcUNHgh1Uxxd4I2CYyXchn6z/mmcVk8b2R7XsehobzBRUGmhuYA4mFDpy45sSzww8UwBpwCq7yVCgnWVybaCcepVMUIRsre/yyExJR1s8WhAO+DBmhzo+72X77tYAUHPEEqPv5FGGCXeDwgAqkGKga4X+cUsgMhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790075853; c=relaxed/simple;
	bh=XKGkk2a4PbnK5iwG44SFBmfr6vaqHlL0/4jYF4cmMbE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UnnS+1rAjb3kyii3K8lDkGws34+dxTIskl98+dG9FpdiaWPvi2ACmGuaFFlTevZ+8Qpy2qZXuPMNTrIg0hI2niQaIND8GuwhqqoE6v4+63O829MsskwceZ3qeob+cQ/jaEOqZZaJJuNWRNVST0GrOvuXtcWqXWycjTxELw5nzhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=KsOyxUKg; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="KsOyxUKg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790075852; x=1821611852;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=XKGkk2a4PbnK5iwG44SFBmfr6vaqHlL0/4jYF4cmMbE=;
  b=KsOyxUKgRjFmpGQDJaWiWx9odS3Z7+nN3hNv7S/mRLl3lMBsoSb9wVCk
   TzHuGI6+lTZ1nCSJSOewxRr2FQIW+/L3yxtg4o85aHalempaZx+4nGuIF
   PMh7LGrh6AKoXeJtTklOx91CVQLwEXUp50T3q5yatHrACesTQx8Gzod1i
   IKHvI9EvRflEv1nrkgEKZDPpNR55jIontssNLf3tHaRiDQ5HUqG4pH3qP
   L8Aj3yR0RacKnAgL47+VWwzP00P334zCpw92QWyUCY4c/8hRaPOnLEiIL
   W8Vwj4lQQHDrLaWtSxdnDpvm+W81BcCgQ4PV90MvVMgkw9aHYEbK81j1V
   g==;
X-CSE-ConnectionGUID: aDhC+09HQx2QNSNR3wYuBA==
X-CSE-MsgGUID: Ze5GbkA8QKKGxdrJPMn8mw==
X-IronPort-AV: E=McAfee;i="6800,10657,11912"; a="89591593"
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="89591593"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:17:31 -0700
X-CSE-ConnectionGUID: cJps0dmSRQqUkwM/EQlb7Q==
X-CSE-MsgGUID: Es88i5wjRt+YpNdkRUQhkA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,116,1787036400"; 
   d="scan'208";a="273265359"
Received: from carterle-desk.ger.corp.intel.com (HELO kekkonen.fi.intel.com) ([10.245.245.41])
  by fmviesa008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Sep 2026 04:17:26 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 0FA6E121B9F;
	Tue, 22 Sep 2026 14:17:26 +0300 (EEST)
Date: Tue, 22 Sep 2026 14:17:26 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Dan Carpenter <error27@gmail.com>,
	Ricardo Ribalda <ribalda@chromium.org>
Cc: Ceclan Dumitru <mitrutzceclan@gmail.com>, dumitru.ceclan@analog.com,
	Tomi Valkeinen <tomi.valkeinen+renesas@ideasonboard.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>
Subject: Re: [PATCH v16 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <arJjxjiWVlnHhioR@kekkonen.localdomain>
References: <20260831-gmsl2-3_serdes-v16-0-4fa6e08bb514@analog.com>
 <apqGlTiybdvQX3Ao@kekkonen.localdomain>
 <eff6fe78-cc4b-4192-93ed-53a738fc3c3a@gmail.com>
 <aqU5QFGmYlCtbdiE@kekkonen.localdomain>
 <CANiDSCv=cwm=aHLfO_ccPfc-XyK3gS8Y+8DZpbb3gcXX0n8mqQ@mail.gmail.com>
 <aqfyYSagcejWb4xD@stanley.mountain>
 <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANiDSCtEmAZippX45kaxjWAHs+cd+vpFFtxOnnz00nmVnkgqzQ@mail.gmail.com>

Hi Ricardo, Dan,

On Tue, Sep 15, 2026 at 05:56:43PM +0200, Ricardo Ribalda wrote:
> Hi Dan, Hi Sakari
> 
> On Mon, 14 Sept 2026 at 15:11, Dan Carpenter <error27@gmail.com> wrote:
> >
> > On Mon, Sep 14, 2026 at 02:10:10PM +0200, Ricardo Ribalda wrote:
> > > Hi Sakari
> > >
> > > On Sat, 12 Sept 2026 at 13:36, Sakari Ailus
> > > <sakari.ailus@linux.intel.com> wrote:
> > > >
> > > > Hi Dumitru, Dan, Ricardo,
> > > >
> > > > On Tue, Sep 08, 2026 at 01:35:05PM +0300, Ceclan Dumitru wrote:
> > > > > > Can you check this
> > > > > > <URL:https://linux-media.pages.freedesktop.org/-/users/sailus/-/jobs/109521830/artifacts/junit/test-smatch.log.txt>
> > > > > > please? If there's a single patch that needs to be modified, I can squash a
> > > > > > patch into that, otherwise v17 it is.
> > > > > >
> > > > >
> > > > > These are the same warns reported by Niklas in V13. Dan fixed them in
> > > > > smatch in devel branch but fix is not in master. Testing with smatch on
> > > > > that branch yields no warnings.
> > > >
> > > > Dan: any plans to merge these things to master some time soon? Or:
> > > >
> > > > Ricardo: could we use devel branch of smatch for some time?
> > >
> > > Do you know what patch fixes it? If it is easy to cherry pick I can
> > > add it to our list of smatch patches
> > > https://gitlab.freedesktop.org/linux-media/media-ci/-/tree/main/third_party?ref_type=heads
> > >
> >
> > Commit d12183645a31 ("precedence: silence some false positives")
> >
> > Sorry, I felt like I was close to merging devel but then I started
> > another major surgery to the core and got stuck.
> 
> Thanks for the pointer. I have added the patch to media-ci
> https://gitlab.freedesktop.org/linux-media/media-ci/-/merge_requests/351
> 
> Now that I have your attention ... :P
> 
> May I ask you to look int
> https://lore.kernel.org/all/20260914-unqual-v2-0-60a1407a0cd4@chromium.org/
> in case you have missed it?

I understand the required commit is there and I tried to push the Maxim
serdes driver again but I'm still getting
<URL:https://gitlab.freedesktop.org/linux-media/users/sailus/-/jobs/110822240/artifacts/file/junit/test-smatch.log.txt>.

I wonder if we could have the devel branch there or some more commits...?

-- 
Regards,

Sakari Ailus
