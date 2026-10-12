Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B290352E07B
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 17:49:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791913780; cv=none; b=f3vwPUON6CD7whcu942nPI67/Pfu1XKnafbe3b7Rbwjn0lhctMK6e/uadBZR1c6dA5e5hJ+cKtvEz6zVS/QSjs/PO1UE/RlprTys/KYv9IaBgipKqrEQKV/Xs9Zj99euK+ZEsbTvcbBJfHafLjVhRAcAC1MfKzCXBbel6X2VMro=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791913780; c=relaxed/simple;
	bh=XfWNez3TZElIw3B+tobB5BSrfbaynnFmNqa9anO7WiM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YKQWEQ4K+n41QbHKPZfvQs+UtzefCCAoH0lwnJg9byAB7i2gpbQivtOseIpzIgc89OL7WwEoHLpnHf8HxKNwwfXDg4FiWZdtGhQj23CWYW8+gvHz+PeHqeHcKNQGwByc1fsEFDceMxwXqD1d0MbhLsQLXccR89/Md+yrMC6jL1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=lGc2uJhE; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="lGc2uJhE"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E7AE31A1218
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 17:49:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id BBFEB60362
	for <linux-gpio@vger.kernel.org>; Tue, 13 Oct 2026 17:49:34 +0000 (UTC)
Received: by mail.galae.net (Postcow, from userid 0)
	id 40AA911D7183E; Tue, 13 Oct 2026 19:49:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791913774; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=eAuhjWIHoJ+lPcsgkZ9ZICB7wFWD1mA0dcHUmJgisnU=;
	b=lGc2uJhEAzwgNhCDgH8pClbsLaAPagg/hFzDZ6c2TuDMpgTV4IUz1FuBNB7W1viV6Y6dmu
	MwXczTXkj186RMCXzsXWUIYscfF1KQ+Gc+gTMMdayYnAD2oQAzdkilrRn7Sy40sUac9oFg
	tIplH61OwprVkT/TKXtIrBoe3zyJKMFUAmILaSnyfDMHhPrI3if2DP/VG5w0l57TUxZRXi
	Qdv5sWBxdtsPNJXGRARVBITtr4UfUdDQlW2ykgJjdJ0oiFxSuGE6+wmIpJZvgrjbjxGNAA
	9Gu93kgUeszDudQgXG1CeyMDRynjucui/bER6Rc5rDokHGhLOYFej/LZ/myDnw==
Authentication-Results: mail.galae.net;
	none
AF:
NF:0
PS:10
SRH:1
SFN:
DSR:
MID:
CFG:
PT:0
S:herve.codina@bootlin.com
RQ:
SSV:mail.galae.net
NSV:
SSH:
R:<sashiko-bot@kernel.org>,<sashiko-reviews@lists.linux.dev>,<linux-gpio@vger.kernel.org>,<linux-cxl@vger.kernel.org>,<linux-pci@vger.kernel.org>
MAID:1
X-Claws-Privacy-System:
X-Claws-Sign:0
SCF:#imap/herve.codina@bootlin.com@mail.galae.net/Sent
RMID:#imap/herve.codina@bootlin.com@mail.galae.net/INBOX	10571	sashiko-outbox-168281@kernel.org
X-Claws-Auto-Wrapping:0
X-Claws-Auto-Indent:0
X-Claws-End-Special-Headers: 1
Date: Mon, 12 Oct 2026 17:18:11 +0200
From: Herve Codina <herve.codina@bootlin.com>
To: sashiko-bot@kernel.org
Cc: sashiko-reviews@lists.linux.dev, linux-gpio@vger.kernel.org,
 linux-cxl@vger.kernel.org, linux-pci@vger.kernel.org
Subject: Re: [PATCH v13 08/10] PCI: of: Set fwnode device of newly created
 PCI device nodes
Message-ID: <20261012171811.50f6cb9f@bootlin.com>
In-Reply-To: <sashiko-outbox-168281@kernel.org>
References: <20261012142826.159178-1-herve.codina@bootlin.com>
	<20261012142826.159178-9-herve.codina@bootlin.com>
	<sashiko-outbox-168281@kernel.org>
Organization: Bootlin
X-Mailer: Claws Mail 4.4.0 (GTK 3.24.52; x86_64-redhat-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: None
X-Rspamd-Queue-Id: 40AA911D7183E
X-Spamd-Result: default: False [0.50 / 30.00];
	DATE_IN_PAST(1.00)[26];
	BAYES_HAM(-0.40)[72.13%];
	MIME_GOOD(-0.10)[text/plain];
	BCC(0.00)[];
	RCVD_COUNT_ZERO(0.00)[0];
	DKIM_SIGNED(0.00)[bootlin.com:s=dkim];
	ARC_NA(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MAILCOW_DOMAIN_HEADER_FROM(0.00)[bootlin.com];
	URIBL_BLOCKED(0.00)[bootlin.com:mid,bootlin.com:email,localhost:rdns,localhost:helo];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	TO_DN_NONE(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5]

On Mon, 12 Oct 2026 14:44:48 +0000
sashiko-bot@kernel.org wrote:

> Thank you for your contribution! Sashiko AI review found 1 potential issue(s) to consider:
> - [High] base: TOCTOU data race and UAF on fwnode->dev access
> --
> 
> commit dc94be607770b564614555ac56ea83f070fa3dd4
> Author: Herve Codina <herve.codina@bootlin.com>
> 
> PCI: of: Set fwnode device of newly created PCI device nodes
> 
> Device-tree node can be created when CONFIG_PCI_DYNAMIC_OF_NODES. Those
> nodes are created and filled based on PCI core information but the
> fwnode device field is not set.
> 
> > diff --git a/drivers/pci/of.c b/drivers/pci/of.c
> > index 29b63a9090ae3..8914bfa25dc11 100644
> > --- a/drivers/pci/of.c
> > +++ b/drivers/pci/of.c
> > @@ -736,6 +736,7 @@ void of_pci_remove_node(struct pci_dev *pdev)
> >  	if (!np || !of_node_check_flag(np, OF_DYNAMIC))
> >  		return;
> >  
> > +	fw_devlink_set_device(&np->fwnode, NULL);  
> 
> [Severity: High]
> Does this locklessly clear the fwnode device while another traversal might be
> reading it?
> 
> If a PCI device is concurrently removed while a driver is being bound to
> another device on the same system, of_pci_remove_node() clears fwnode->dev
> locklessly here.
> 
> Concurrently, __fw_devlink_pickup_dangling_consumers() in drivers/base/core.c
> can traverse the fwnode tree and read it locklessly:
> 
> 	if (fwnode->dev && fwnode->dev->bus)
> 		return;

I don't think so.

__fw_devlink_pickup_dangling_consumers() can look at fwnode->dev but those
fwnode->dev are not in the same branch in the tree as the one where the fwnode
being modified is located.

I don't see any cases where __fw_devlink_pickup_dangling_consumers() can
reach our fwnode.

In other word I don't see any race condition on my side and so I will not try
to fix that point except if this "potential" issue is confirmed by other people.
Indeed, I could be wrong in my analysis but without further details, I don't
think the issue reported here can happen.

Best regards,
Hervé
