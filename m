Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3E442D762;
	Fri, 17 Jul 2026 14:52:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784299976; cv=none; b=SrG/nGjc47WbOuBb/XlYGZh1yRDffG0qmeL5JMoDoX947iTuUYJuCXTgfPLZy4DZKtOFbm+3x2J5a616lCy88e4VHsjNKcN2W/bzWmzhp2ql+Mpmv1Bsd1wvqfjyLgwwurgLlmNpCxJ8UFGdslGxadTZDVdxR2dBERu/7yGBvQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784299976; c=relaxed/simple;
	bh=jhqCf8H4bFnautpNQAv2PA8MpMIhyVdDLf0W2o3pAYw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kMQApi+mXttKnDnVny6JBVZYj8VzS1cQbGyz3vE7M+3Kb4JeyT9TacUU84DnLnLm2rnT/tc5VLbqtml3chmqeD6MvXF6oSuH6IpFBZDSOAb5scubRR1iNC825iuZ7mQGnZTXENHRvQ1N9tS+vbSQ16ggntDW45+2TPERJWKFr70=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=hDwfSEWY; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="hDwfSEWY"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C16644E40E1A;
	Fri, 17 Jul 2026 14:52:46 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 93C3760361;
	Fri, 17 Jul 2026 14:52:46 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2101411BD0B40;
	Fri, 17 Jul 2026 16:52:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1784299964; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=QLE1yq7MLmvt1xlxQRse3Cefa2hzudSIrfsMyNRzjcI=;
	b=hDwfSEWY/l7NFKeBoIwPDKleT+R3IGz4Jk1ykcPFrG1vJLqkWGUkw0D/tLyjMsMgeNt+WJ
	zOjDL5OVE2aYSs2YVT2bLvO6+zg2EOCmOrwVNzAEUsY7Whqk42hf8ZzbO9Z8AhbX6nKqjE
	1gnPBpIrULfE3Nv68cIAFcA0zIqkgIALcynqUOlBIWVjl6eOz4MqK7jYjxpnoj7HbD2xJT
	uLYQ4zqJ6nW8qgBifjG98z8DBlfkGDMeQToH5+4lxnFgLibhOPVvsD4WeHBEMcjRYdjZar
	0PpCDdPc9VWLRVHZANlWp3aOPMOjNu4JCsc0qS2pO9e66jk9qMO3PI6tm56xbg==
From: Herve Codina <herve.codina@bootlin.com>
To: Richard Cheng <icheng@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Lizhi Hou <lizhi.hou@amd.com>,
	Herve Codina <herve.codina@bootlin.com>
Cc: driver-core@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-sound@vger.kernel.org,
	patches@opensource.cirrus.com,
	linux-gpio@vger.kernel.org,
	linux-acpi@vger.kernel.org,
	linux-cxl@vger.kernel.org,
	Allan Nielsen <allan.nielsen@microchip.com>,
	Horatiu Vultur <horatiu.vultur@microchip.com>,
	Daniel Machon <daniel.machon@microchip.com>,
	Steen Hegelund <steen.hegelund@microchip.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	stable@vger.kernel.org
Subject: [PATCH v10 06/10] PCI: of: Use fw_devlink_set_device()
Date: Fri, 17 Jul 2026 16:51:41 +0200
Message-ID: <20260717145147.823749-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260717145147.823749-1-herve.codina@bootlin.com>
References: <20260717145147.823749-1-herve.codina@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-gpio@vger.kernel.org
List-Id: <linux-gpio.vger.kernel.org>
List-Subscribe: <mailto:linux-gpio+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-gpio+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3

The code set directly fwnode.dev field.

Use the dedicated fw_devlink_set_device() helper to perform this
operation.

Cc: stable@vger.kernel.org
Signed-off-by: Herve Codina <herve.codina@bootlin.com>
Reviewed-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Acked-by: Bjorn Helgaas <bhelgaas@google.com>
---
Cc stable because used by other patches with Fixes + Cc stable
---
 drivers/pci/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index 8b18c4ba845c..ee9eb384b377 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -803,7 +803,7 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 	 * bus. Avoid any new device creation.
 	 */
 	of_node_set_flag(np, OF_POPULATED);
-	np->fwnode.dev = &bridge->dev;
+	fw_devlink_set_device(&np->fwnode, &bridge->dev);
 	fwnode_dev_initialized(&np->fwnode, true);
 
 	ret = of_changeset_apply(cset);
-- 
2.55.0

