Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B462447C0FB;
	Wed,  9 Sep 2026 08:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788940949; cv=none; b=JvpHx6CftWXvoU9Uv3zaHmre54V4D5Zwe6wt4b8hfhiRlySGRkMkmDYYlNFLCBgFc41ThIvmaIxvmxp/6rKhBhmDJ249x584+4ezFwitNlD2luVTVshOV9UlxQ8S4yB36/lk/I4jhLvfVm1MZHprEYvQM7X38EcGrDYKHRjM7lg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788940949; c=relaxed/simple;
	bh=9LeEu4x7V6y2YtuNmvhElFPZm3BTZTOIhLxpHirtN+g=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t0uT6i6kQ8yXNPSUAgCuiXo9vbJXPcsL/sCUwy5VvuVUGko1v/Fq2a1lXbbUr4575rYoV4LgR5XaUkh0a+GqH2uBpMboILWlLcDngWJhHLeee29JbGUIWtFL4vG1D/RAk7ZqwLs5E3ypyK/Gm+2prnxPGpHaoK+G1qwMF17DZ18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=nzIJsFZO; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="nzIJsFZO"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 5531A4E415AE;
	Wed,  9 Sep 2026 08:02:25 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1F9D960448;
	Wed,  9 Sep 2026 08:02:25 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 95E5F11C7AF62;
	Wed,  9 Sep 2026 10:02:13 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788940939; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=xsrAagyqRXEIrY2kRm2QxLCi483uP0dBlGJSQWRJ/JI=;
	b=nzIJsFZO7aqQTzJQIPcALUuuz0HNXdjiZcXHeEhX3IMfJ7+qwgTMSDaADtcRytz2+cT+GN
	9nbxwDYT8/6tmVx41u5T4u7g1+fZ87b0ld0P83lilfpR+u/PchYRnGYiTu/IfYfxXeUrag
	/6b1A3KcUzHMz3dPdnvSASFQTml+mgN2eSXC6VByCJKpEH8VVyLL9EMQq662ORENgk9jQB
	Phi9r3RghHGPA8Uroayg34PCzZyYskUm+83+1cwJ1RbG8FZsqZQpiFiizKmfToC6kXpdMh
	EI+mFpZzqS2mYKZ/vv4sesw1Sc/fa353H3OI/Vi2EpRcy26evnrvoirv+UP6/A==
From: Herve Codina <herve.codina@bootlin.com>
To: Richard Cheng <icheng@nvidia.com>,
	Andrew Lunn <andrew@lunn.ch>,
	Rob Herring <robh@kernel.org>,
	Saravana Kannan <saravanak@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Charles Keepax <ckeepax@opensource.cirrus.com>,
	Richard Fitzgerald <rf@opensource.cirrus.com>,
	David Rhodes <david.rhodes@cirrus.com>,
	Linus Walleij <linusw@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
	Daniel Scally <djrscally@gmail.com>,
	Heikki Krogerus <heikki.krogerus@linux.intel.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Bartosz Golaszewski <brgl@kernel.org>,
	Len Brown <lenb@kernel.org>,
	Davidlohr Bueso <dave@stgolabs.net>,
	Jonathan Cameron <jic23@kernel.org>,
	Dave Jiang <dave.jiang@intel.com>,
	Alison Schofield <alison.schofield@intel.com>,
	Vishal Verma <vishal.l.verma@intel.com>,
	Dan Williams <djbw@kernel.org>,
	Ira Weiny <iweiny@kernel.org>,
	Li Ming <ming.li@zohomail.com>,
	Herve Codina <herve.codina@bootlin.com>,
	Lizhi Hou <lizhi.hou@amd.com>
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
	stable@vger.kernel.org,
	Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
Subject: [PATCH v11 06/10] PCI: of: Use fw_devlink_set_device()
Date: Wed,  9 Sep 2026 10:01:05 +0200
Message-ID: <20260909080114.591938-7-herve.codina@bootlin.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909080114.591938-1-herve.codina@bootlin.com>
References: <20260909080114.591938-1-herve.codina@bootlin.com>
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
Reviewed-by: Richard Cheng <icheng@nvidia.com>
Acked-by: Manivannan Sadhasivam <manivannan.sadhasivam@oss.qualcomm.com>
---
Cc stable because used by other patches with Fixes + Cc stable
---
 drivers/pci/of.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/pci/of.c b/drivers/pci/of.c
index a51dff91b196..0f45c5b72458 100644
--- a/drivers/pci/of.c
+++ b/drivers/pci/of.c
@@ -882,7 +882,7 @@ void of_pci_make_host_bridge_node(struct pci_host_bridge *bridge)
 	 * bus. Avoid any new device creation.
 	 */
 	of_node_set_flag(np, OF_POPULATED);
-	np->fwnode.dev = &bridge->dev;
+	fw_devlink_set_device(&np->fwnode, &bridge->dev);
 	fwnode_dev_initialized(&np->fwnode, true);
 
 	ret = of_changeset_apply(cset);
-- 
2.55.0

