Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D35E93F8251;
	Thu, 27 Aug 2026 08:45:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787820342; cv=none; b=QLDrMiwHRD08YlyGzhcw1DNwkQlmdDIwxLPHs+RSyZf0y4n/1l23Our5z53P1UZ5qsC7pqoxDUJAanWmgVHmwm255sNKRog0U3lXULNRahmpgJ9D85CwjphunTIj5tYSVwxqdrAiVP1E+tE19C1SyfY3wqTg2YOR1A7cWH4sCb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787820342; c=relaxed/simple;
	bh=Bun68MjdXjqcRgCBPm51Kng9cowX31nQxyMJXlq0bt0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=QH79QzwDSdlJfuetMx7cZd8kcFxn1ciewMOk0fBFTNekTEcMi88e9RXRkQ49KdepdSSc3oQf7uuv7OXMt0VhMt4TwKTprCOdN4Xf6rnR2MEgxQh0q/t+Pnb84VvST6Aqzd4TpDNYtJRl1fj/Wn/2hIVn3NbQ5NjbVZDSQsZEams=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=ad90LDso; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="ad90LDso"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1787820340; x=1819356340;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=Bun68MjdXjqcRgCBPm51Kng9cowX31nQxyMJXlq0bt0=;
  b=ad90LDsoJdhSGLyhsjnRkVPV4JWmgSTjPpSLhIx2uGbopF63nYF2N9TL
   3yjuDa0PrBv44XmhDZQ/2eq2KgukqwnvTJKjc17Llmvz6vLOAjPxNBFjw
   elRdMg0Wej97KUw1QwYXU7wxfvDS1BjgeJXjI1T05+XC1VVY4heR1aozO
   MXYOPCPct9kaGBEsMi4PlwAaAsG7rGx3PgWMXX0ETF/czvnpRx6IbEY8B
   XuqpSDLnYBAROZECkGLsf6mHxNEhgKUyaeNUzn2SdKKbwhiLlUWHk+cm0
   cdyXTy7e5/2KCCcrMAUG8AqA7cGqdIkN2d/nZAWPCg2CTWnb0OaMiMYz1
   w==;
X-CSE-ConnectionGUID: FBKftvZZSVauFY1geyqfDQ==
X-CSE-MsgGUID: VgHHO20ZTDyW2kgBvAldqg==
X-IronPort-AV: E=McAfee;i="6800,10657,11887"; a="88235710"
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="88235710"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:45:39 -0700
X-CSE-ConnectionGUID: l6yvOl/tRBClXA/x6DaMPQ==
X-CSE-MsgGUID: zHoUCxLMRBOEJZKFuX2TIA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,246,1779174000"; 
   d="scan'208";a="266513466"
Received: from amilburn-desk.amilburn-desk (HELO kekkonen.fi.intel.com) ([10.245.244.174])
  by orviesa010-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Aug 2026 01:45:34 -0700
Received: from kekkonen.localdomain (localhost [IPv6:::1])
	by kekkonen.fi.intel.com (Postfix) with SMTP id 2F24B120C1D;
	Thu, 27 Aug 2026 11:45:32 +0300 (EEST)
Date: Thu, 27 Aug 2026 11:45:32 +0300
Organization: Intel Finland Oy - BIC 0357606-4 - c/o Alberga Business Park, 6 krs, Bertel Jungin Aukio 5, 02600 Espoo
From: Sakari Ailus <sakari.ailus@linux.intel.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dumitru.ceclan@analog.com, mitrutzceclan@gmail.com,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, linux-staging@lists.linux.dev,
	linux-gpio@vger.kernel.org,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund+renesas@ragnatech.se>,
	Martin Hecht <Martin.Hecht@avnet.eu>,
	Andrian Suciu <Adrian.Suciu@analog.com>,
	Cosmin Tanislav <demonsingur@gmail.com>,
	Vivekananda Dayananda <vivekana@amd.com>,
	Cory Keitz <ckeitz@amazon.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Julien Massot <julien.massot@collabora.com>,
	Rob Herring <robh@kernel.org>,
	Niklas =?iso-8859-1?Q?S=F6derlund?= <niklas.soderlund@ragnatech.se>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [PATCH v15 00/22] media: i2c: add Maxim GMSL2/3 serializer and
 deserializer drivers
Message-ID: <ao_5LDgGjzvPZVXU@kekkonen.localdomain>
References: <20260807-gmsl2-3_serdes-v15-0-7212e9e5156a@analog.com>
 <d0537d7f-6e74-4cca-93ae-398530c5cd51@ideasonboard.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0537d7f-6e74-4cca-93ae-398530c5cd51@ideasonboard.com>

Hei Tomi,

On Wed, Aug 26, 2026 at 01:15:03PM +0300, Tomi Valkeinen wrote:
> Hi,
> 
> On 07/08/2026 16:02, Dumitru Ceclan via B4 Relay wrote:
> > This series adds new drivers for multiple Maxim GMSL2 and GMSL3 devices,
> > replacing the few GMSL2 drivers already in upstream, and introducing a
> > common framework that can be used to implement such GMSL chips, which
> > avoids code duplication while also adding support for previously
> > unsupported features.
> If you send a series, it needs your Signed-off-by.

Thanks for testing this. It's been out for review for long but without much
attention. :-\

> 
> This series also depends on the internal pad, which is not upstream and is
> not just a straightforward add-a-define case. Sakari's "[PATCH v12 00/86]
> Generic line based metadata support, internal pads" has it, and additional
> patches around it. For the time being, I think the internal pad
> unfortunately blocks merging this.

I've briefly discussed this with Laurent and it seems we both think the
internal pads could be introduced for this purpose. I don't see this being
an issue; we still need to pay attention to how they are used which we'd
need to do in any case.

> 
> However, (correct me if I'm wrong) the internal pad is only required for
> TPG. An option would be to remove the TPG support (or at least the parts
> that make it visible, i.e. you could keep the internal functionality), thus
> removing the blocker. The TPG could be added later on top.

That's an option, yes, but I'd just merge the internal pad patch.

> 
> I tested the series on Xilinx Kria KV260 and on TI AM62A SK, both with
> max96716 deserializer and two max96717 serializers with imx219. On Xilinx I
> used RAW8, with and without embedded data. On AM62A I used RAW8 and RAW10.
> 
> The deserializer TPG gives me no frames at all. I recall the clocking for
> the TPG was quite a challenge on at least some max96 serializers, so maybe
> it's related to that.
> 
> The serializer TPG worked, although I think there's something funny with it:
> the initial frames (maybe just the first one) seem to be truncated a bit,
> there's black at the bottom. Another, a bit more unclear, is that sometimes
> ser tpg stops working. If I'm not mistaken, what I did was run cam0-tpg +
> cam1-tpg. Then I tried des tpg. Then cam0-tpg, but it gives me nothing.
> Streaming with cam0+cam1 video "resets" things and it all works again. I've
> seen this a few times, but there seems to be some randomness so I haven't
> been able to pinpoint it, but feels like there's some extra state that's
> left behind into the HW.
> 
> All in all, the normal case (non-tpg) works ok for me:

I'd indeed either fix the TPG before merging the set or postpone adding it
for this reason. :-)

> 
> Tested-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

-- 
Terveisin,

Sakari Ailus
