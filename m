From: kbuild test robot <fengguang.wu@intel.com>
Subject: [pinctrl:devel 19/27]
 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:590:20: warning:
 format '%x' expects argument of type 'unsigned int', but argument 5 has type
 'long unsigned int'
Date: Mon, 16 Oct 2017 21:11:28 +0800
Message-ID: <201710162126.V8arYsHH%fengguang.wu@intel.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; boundary="uAKRQypu60I7Lcqm"
Return-path: <linux-gpio-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:64649 "EHLO mga11.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752312AbdJPNME (ORCPT <rfc822;linux-gpio@vger.kernel.org>);
        Mon, 16 Oct 2017 09:12:04 -0400
Content-Disposition: inline
Sender: linux-gpio-owner@vger.kernel.org
List-Id: linux-gpio@vger.kernel.org
To: Phil Reid <preid@electromag.com.au>
Cc: kbuild-all@01.org, linux-gpio@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>, Sebastian Reichel <sebastian.reichel@collabora.co.uk>


--uAKRQypu60I7Lcqm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/linusw/linux-pinctrl.git devel
head:   7d2c7db6e4a7c06fdb33ccc9c54ee125bb630546
commit: d219b924611a5cceb17cc6b9a8dd103ab9668c94 [19/27] pinctrl: change Kconfig PINCTRL variable to a menuconfig
config: m32r-allmodconfig (attached as .config)
compiler: m32r-linux-gcc (GCC) 6.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        git checkout d219b924611a5cceb17cc6b9a8dd103ab9668c94
        # save the attached .config to linux build tree
        make.cross ARCH=m32r 

All warnings (new ones prefixed by >>):

   In file included from arch/m32r/include/uapi/asm/byteorder.h:7:0,
                    from arch/m32r/include/asm/bitops.h:21,
                    from include/linux/bitops.h:37,
                    from include/linux/kernel.h:10,
                    from include/linux/clk.h:16,
                    from drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:15:
   include/linux/byteorder/big_endian.h:7:2: warning: #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN [-Wcpp]
    #warning inconsistent configuration, needs CONFIG_CPU_BIG_ENDIAN
     ^~~~~~~
   In file included from include/linux/printk.h:329:0,
                    from include/linux/kernel.h:13,
                    from include/linux/clk.h:16,
                    from drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:15:
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c: In function 'configure_memdma_and_inputblock':
>> drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:590:20: warning: format '%x' expects argument of type 'unsigned int', but argument 5 has type 'long unsigned int' [-Wformat=]
     dev_dbg(fei->dev, "chan=%d PIDF_BASE=0x%x pid_bus_addr=%pad\n",
                       ^
   include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
>> drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:590:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fei->dev, "chan=%d PIDF_BASE=0x%x pid_bus_addr=%pad\n",
     ^~~~~~~
>> drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:20: warning: format '%d' expects argument of type 'int', but argument 5 has type 'long unsigned int' [-Wformat=]
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
                       ^
   include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
     ^~~~~~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:20: warning: format '%d' expects argument of type 'int', but argument 6 has type 'long unsigned int' [-Wformat=]
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
                       ^
   include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
     ^~~~~~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:20: warning: format '%d' expects argument of type 'int', but argument 7 has type 'long unsigned int' [-Wformat=]
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
                       ^
   include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
     ^~~~~~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:20: warning: format '%d' expects argument of type 'int', but argument 8 has type 'long unsigned int' [-Wformat=]
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
                       ^
   include/linux/dynamic_debug.h:134:39: note: in definition of macro 'dynamic_dev_dbg'
      __dynamic_dev_dbg(&descriptor, dev, fmt, \
                                          ^~~
   drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c:607:2: note: in expansion of macro 'dev_dbg'
     dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
     ^~~~~~~

vim +590 drivers/media/platform/sti/c8sectpfe/c8sectpfe-core.c

c5f5d0f9 Peter Griffin 2015-07-30  448  
c5f5d0f9 Peter Griffin 2015-07-30  449  static int configure_memdma_and_inputblock(struct c8sectpfei *fei,
c5f5d0f9 Peter Griffin 2015-07-30  450  				struct channel_info *tsin)
c5f5d0f9 Peter Griffin 2015-07-30  451  {
c5f5d0f9 Peter Griffin 2015-07-30  452  	int ret;
c5f5d0f9 Peter Griffin 2015-07-30  453  	u32 tmp;
c5f5d0f9 Peter Griffin 2015-07-30  454  	char tsin_pin_name[MAX_NAME];
c5f5d0f9 Peter Griffin 2015-07-30  455  
c5f5d0f9 Peter Griffin 2015-07-30  456  	if (!fei || !tsin)
c5f5d0f9 Peter Griffin 2015-07-30  457  		return -EINVAL;
c5f5d0f9 Peter Griffin 2015-07-30  458  
c5f5d0f9 Peter Griffin 2015-07-30  459  	dev_dbg(fei->dev, "%s:%d Configuring channel=%p tsin=%d\n"
c5f5d0f9 Peter Griffin 2015-07-30  460  		, __func__, __LINE__, tsin, tsin->tsin_id);
c5f5d0f9 Peter Griffin 2015-07-30  461  
c5f5d0f9 Peter Griffin 2015-07-30  462  	init_completion(&tsin->idle_completion);
c5f5d0f9 Peter Griffin 2015-07-30  463  
c5f5d0f9 Peter Griffin 2015-07-30  464  	tsin->back_buffer_start = kzalloc(FEI_BUFFER_SIZE +
c5f5d0f9 Peter Griffin 2015-07-30  465  					FEI_ALIGNMENT, GFP_KERNEL);
c5f5d0f9 Peter Griffin 2015-07-30  466  
c5f5d0f9 Peter Griffin 2015-07-30  467  	if (!tsin->back_buffer_start) {
c5f5d0f9 Peter Griffin 2015-07-30  468  		ret = -ENOMEM;
c5f5d0f9 Peter Griffin 2015-07-30  469  		goto err_unmap;
c5f5d0f9 Peter Griffin 2015-07-30  470  	}
c5f5d0f9 Peter Griffin 2015-07-30  471  
c5f5d0f9 Peter Griffin 2015-07-30  472  	/* Ensure backbuffer is 32byte aligned */
c5f5d0f9 Peter Griffin 2015-07-30  473  	tsin->back_buffer_aligned = tsin->back_buffer_start
c5f5d0f9 Peter Griffin 2015-07-30  474  		+ FEI_ALIGNMENT;
c5f5d0f9 Peter Griffin 2015-07-30  475  
c5f5d0f9 Peter Griffin 2015-07-30  476  	tsin->back_buffer_aligned = (void *)
c5f5d0f9 Peter Griffin 2015-07-30  477  		(((uintptr_t) tsin->back_buffer_aligned) & ~0x1F);
c5f5d0f9 Peter Griffin 2015-07-30  478  
c5f5d0f9 Peter Griffin 2015-07-30  479  	tsin->back_buffer_busaddr = dma_map_single(fei->dev,
c5f5d0f9 Peter Griffin 2015-07-30  480  					(void *)tsin->back_buffer_aligned,
c5f5d0f9 Peter Griffin 2015-07-30  481  					FEI_BUFFER_SIZE,
c5f5d0f9 Peter Griffin 2015-07-30  482  					DMA_BIDIRECTIONAL);
c5f5d0f9 Peter Griffin 2015-07-30  483  
c5f5d0f9 Peter Griffin 2015-07-30  484  	if (dma_mapping_error(fei->dev, tsin->back_buffer_busaddr)) {
c5f5d0f9 Peter Griffin 2015-07-30  485  		dev_err(fei->dev, "failed to map back_buffer\n");
c5f5d0f9 Peter Griffin 2015-07-30  486  		ret = -EFAULT;
c5f5d0f9 Peter Griffin 2015-07-30  487  		goto err_unmap;
c5f5d0f9 Peter Griffin 2015-07-30  488  	}
c5f5d0f9 Peter Griffin 2015-07-30  489  
c5f5d0f9 Peter Griffin 2015-07-30  490  	/*
c5f5d0f9 Peter Griffin 2015-07-30  491  	 * The pid buffer can be configured (in hw) for byte or bit
c5f5d0f9 Peter Griffin 2015-07-30  492  	 * per pid. By powers of deduction we conclude stih407 family
c5f5d0f9 Peter Griffin 2015-07-30  493  	 * is configured (at SoC design stage) for bit per pid.
c5f5d0f9 Peter Griffin 2015-07-30  494  	 */
c5f5d0f9 Peter Griffin 2015-07-30  495  	tsin->pid_buffer_start = kzalloc(2048, GFP_KERNEL);
c5f5d0f9 Peter Griffin 2015-07-30  496  
c5f5d0f9 Peter Griffin 2015-07-30  497  	if (!tsin->pid_buffer_start) {
c5f5d0f9 Peter Griffin 2015-07-30  498  		ret = -ENOMEM;
c5f5d0f9 Peter Griffin 2015-07-30  499  		goto err_unmap;
c5f5d0f9 Peter Griffin 2015-07-30  500  	}
c5f5d0f9 Peter Griffin 2015-07-30  501  
c5f5d0f9 Peter Griffin 2015-07-30  502  	/*
c5f5d0f9 Peter Griffin 2015-07-30  503  	 * PID buffer needs to be aligned to size of the pid table
c5f5d0f9 Peter Griffin 2015-07-30  504  	 * which at bit per pid is 1024 bytes (8192 pids / 8).
c5f5d0f9 Peter Griffin 2015-07-30  505  	 * PIDF_BASE register enforces this alignment when writing
c5f5d0f9 Peter Griffin 2015-07-30  506  	 * the register.
c5f5d0f9 Peter Griffin 2015-07-30  507  	 */
c5f5d0f9 Peter Griffin 2015-07-30  508  
c5f5d0f9 Peter Griffin 2015-07-30  509  	tsin->pid_buffer_aligned = tsin->pid_buffer_start +
c5f5d0f9 Peter Griffin 2015-07-30  510  		PID_TABLE_SIZE;
c5f5d0f9 Peter Griffin 2015-07-30  511  
c5f5d0f9 Peter Griffin 2015-07-30  512  	tsin->pid_buffer_aligned = (void *)
c5f5d0f9 Peter Griffin 2015-07-30  513  		(((uintptr_t) tsin->pid_buffer_aligned) & ~0x3ff);
c5f5d0f9 Peter Griffin 2015-07-30  514  
c5f5d0f9 Peter Griffin 2015-07-30  515  	tsin->pid_buffer_busaddr = dma_map_single(fei->dev,
c5f5d0f9 Peter Griffin 2015-07-30  516  						tsin->pid_buffer_aligned,
c5f5d0f9 Peter Griffin 2015-07-30  517  						PID_TABLE_SIZE,
c5f5d0f9 Peter Griffin 2015-07-30  518  						DMA_BIDIRECTIONAL);
c5f5d0f9 Peter Griffin 2015-07-30  519  
c5f5d0f9 Peter Griffin 2015-07-30  520  	if (dma_mapping_error(fei->dev, tsin->pid_buffer_busaddr)) {
c5f5d0f9 Peter Griffin 2015-07-30  521  		dev_err(fei->dev, "failed to map pid_bitmap\n");
c5f5d0f9 Peter Griffin 2015-07-30  522  		ret = -EFAULT;
c5f5d0f9 Peter Griffin 2015-07-30  523  		goto err_unmap;
c5f5d0f9 Peter Griffin 2015-07-30  524  	}
c5f5d0f9 Peter Griffin 2015-07-30  525  
c5f5d0f9 Peter Griffin 2015-07-30  526  	/* manage cache so pid bitmap is visible to HW */
c5f5d0f9 Peter Griffin 2015-07-30  527  	dma_sync_single_for_device(fei->dev,
c5f5d0f9 Peter Griffin 2015-07-30  528  				tsin->pid_buffer_busaddr,
c5f5d0f9 Peter Griffin 2015-07-30  529  				PID_TABLE_SIZE,
c5f5d0f9 Peter Griffin 2015-07-30  530  				DMA_TO_DEVICE);
c5f5d0f9 Peter Griffin 2015-07-30  531  
c5f5d0f9 Peter Griffin 2015-07-30  532  	snprintf(tsin_pin_name, MAX_NAME, "tsin%d-%s", tsin->tsin_id,
c5f5d0f9 Peter Griffin 2015-07-30  533  		(tsin->serial_not_parallel ? "serial" : "parallel"));
c5f5d0f9 Peter Griffin 2015-07-30  534  
c5f5d0f9 Peter Griffin 2015-07-30  535  	tsin->pstate = pinctrl_lookup_state(fei->pinctrl, tsin_pin_name);
c5f5d0f9 Peter Griffin 2015-07-30  536  	if (IS_ERR(tsin->pstate)) {
c5f5d0f9 Peter Griffin 2015-07-30  537  		dev_err(fei->dev, "%s: pinctrl_lookup_state couldn't find %s state\n"
c5f5d0f9 Peter Griffin 2015-07-30  538  			, __func__, tsin_pin_name);
c5f5d0f9 Peter Griffin 2015-07-30  539  		ret = PTR_ERR(tsin->pstate);
c5f5d0f9 Peter Griffin 2015-07-30  540  		goto err_unmap;
c5f5d0f9 Peter Griffin 2015-07-30  541  	}
c5f5d0f9 Peter Griffin 2015-07-30  542  
c5f5d0f9 Peter Griffin 2015-07-30  543  	ret = pinctrl_select_state(fei->pinctrl, tsin->pstate);
c5f5d0f9 Peter Griffin 2015-07-30  544  
c5f5d0f9 Peter Griffin 2015-07-30  545  	if (ret) {
c5f5d0f9 Peter Griffin 2015-07-30  546  		dev_err(fei->dev, "%s: pinctrl_select_state failed\n"
c5f5d0f9 Peter Griffin 2015-07-30  547  			, __func__);
c5f5d0f9 Peter Griffin 2015-07-30  548  		goto err_unmap;
c5f5d0f9 Peter Griffin 2015-07-30  549  	}
c5f5d0f9 Peter Griffin 2015-07-30  550  
c5f5d0f9 Peter Griffin 2015-07-30  551  	/* Enable this input block */
c5f5d0f9 Peter Griffin 2015-07-30  552  	tmp = readl(fei->io + SYS_INPUT_CLKEN);
c5f5d0f9 Peter Griffin 2015-07-30  553  	tmp |= BIT(tsin->tsin_id);
c5f5d0f9 Peter Griffin 2015-07-30  554  	writel(tmp, fei->io + SYS_INPUT_CLKEN);
c5f5d0f9 Peter Griffin 2015-07-30  555  
c5f5d0f9 Peter Griffin 2015-07-30  556  	if (tsin->serial_not_parallel)
c5f5d0f9 Peter Griffin 2015-07-30  557  		tmp |= C8SECTPFE_SERIAL_NOT_PARALLEL;
c5f5d0f9 Peter Griffin 2015-07-30  558  
c5f5d0f9 Peter Griffin 2015-07-30  559  	if (tsin->invert_ts_clk)
c5f5d0f9 Peter Griffin 2015-07-30  560  		tmp |= C8SECTPFE_INVERT_TSCLK;
c5f5d0f9 Peter Griffin 2015-07-30  561  
c5f5d0f9 Peter Griffin 2015-07-30  562  	if (tsin->async_not_sync)
c5f5d0f9 Peter Griffin 2015-07-30  563  		tmp |= C8SECTPFE_ASYNC_NOT_SYNC;
c5f5d0f9 Peter Griffin 2015-07-30  564  
c5f5d0f9 Peter Griffin 2015-07-30  565  	tmp |= C8SECTPFE_ALIGN_BYTE_SOP | C8SECTPFE_BYTE_ENDIANNESS_MSB;
c5f5d0f9 Peter Griffin 2015-07-30  566  
c5f5d0f9 Peter Griffin 2015-07-30  567  	writel(tmp, fei->io + C8SECTPFE_IB_IP_FMT_CFG(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  568  
c5f5d0f9 Peter Griffin 2015-07-30  569  	writel(C8SECTPFE_SYNC(0x9) |
c5f5d0f9 Peter Griffin 2015-07-30  570  		C8SECTPFE_DROP(0x9) |
c5f5d0f9 Peter Griffin 2015-07-30  571  		C8SECTPFE_TOKEN(0x47),
c5f5d0f9 Peter Griffin 2015-07-30  572  		fei->io + C8SECTPFE_IB_SYNCLCKDRP_CFG(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  573  
c5f5d0f9 Peter Griffin 2015-07-30  574  	writel(TS_PKT_SIZE, fei->io + C8SECTPFE_IB_PKT_LEN(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  575  
c5f5d0f9 Peter Griffin 2015-07-30  576  	/* Place the FIFO's at the end of the irec descriptors */
c5f5d0f9 Peter Griffin 2015-07-30  577  
c5f5d0f9 Peter Griffin 2015-07-30  578  	tsin->fifo = (tsin->tsin_id * FIFO_LEN);
c5f5d0f9 Peter Griffin 2015-07-30  579  
c5f5d0f9 Peter Griffin 2015-07-30  580  	writel(tsin->fifo, fei->io + C8SECTPFE_IB_BUFF_STRT(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  581  	writel(tsin->fifo + FIFO_LEN - 1,
c5f5d0f9 Peter Griffin 2015-07-30  582  		fei->io + C8SECTPFE_IB_BUFF_END(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  583  
c5f5d0f9 Peter Griffin 2015-07-30  584  	writel(tsin->fifo, fei->io + C8SECTPFE_IB_READ_PNT(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  585  	writel(tsin->fifo, fei->io + C8SECTPFE_IB_WRT_PNT(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  586  
c5f5d0f9 Peter Griffin 2015-07-30  587  	writel(tsin->pid_buffer_busaddr,
c5f5d0f9 Peter Griffin 2015-07-30  588  		fei->io + PIDF_BASE(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  589  
ee105cac Peter Griffin 2016-03-24 @590  	dev_dbg(fei->dev, "chan=%d PIDF_BASE=0x%x pid_bus_addr=%pad\n",
c5f5d0f9 Peter Griffin 2015-07-30  591  		tsin->tsin_id, readl(fei->io + PIDF_BASE(tsin->tsin_id)),
62e5f051 Fabio Estevam 2015-08-18  592  		&tsin->pid_buffer_busaddr);
c5f5d0f9 Peter Griffin 2015-07-30  593  
c5f5d0f9 Peter Griffin 2015-07-30  594  	/* Configure and enable HW PID filtering */
c5f5d0f9 Peter Griffin 2015-07-30  595  
c5f5d0f9 Peter Griffin 2015-07-30  596  	/*
c5f5d0f9 Peter Griffin 2015-07-30  597  	 * The PID value is created by assembling the first 8 bytes of
c5f5d0f9 Peter Griffin 2015-07-30  598  	 * the TS packet into a 64-bit word in big-endian format. A
c5f5d0f9 Peter Griffin 2015-07-30  599  	 * slice of that 64-bit word is taken from
c5f5d0f9 Peter Griffin 2015-07-30  600  	 * (PID_OFFSET+PID_NUM_BITS-1) to PID_OFFSET.
c5f5d0f9 Peter Griffin 2015-07-30  601  	 */
c5f5d0f9 Peter Griffin 2015-07-30  602  	tmp = (C8SECTPFE_PID_ENABLE | C8SECTPFE_PID_NUMBITS(13)
c5f5d0f9 Peter Griffin 2015-07-30  603  		| C8SECTPFE_PID_OFFSET(40));
c5f5d0f9 Peter Griffin 2015-07-30  604  
c5f5d0f9 Peter Griffin 2015-07-30  605  	writel(tmp, fei->io + C8SECTPFE_IB_PID_SET(tsin->tsin_id));
c5f5d0f9 Peter Griffin 2015-07-30  606  
c5f5d0f9 Peter Griffin 2015-07-30 @607  	dev_dbg(fei->dev, "chan=%d setting wp: %d, rp: %d, buf: %d-%d\n",
c5f5d0f9 Peter Griffin 2015-07-30  608  		tsin->tsin_id,
c5f5d0f9 Peter Griffin 2015-07-30  609  		readl(fei->io + C8SECTPFE_IB_WRT_PNT(tsin->tsin_id)),
c5f5d0f9 Peter Griffin 2015-07-30  610  		readl(fei->io + C8SECTPFE_IB_READ_PNT(tsin->tsin_id)),
c5f5d0f9 Peter Griffin 2015-07-30  611  		readl(fei->io + C8SECTPFE_IB_BUFF_STRT(tsin->tsin_id)),
c5f5d0f9 Peter Griffin 2015-07-30  612  		readl(fei->io + C8SECTPFE_IB_BUFF_END(tsin->tsin_id)));
c5f5d0f9 Peter Griffin 2015-07-30  613  
c5f5d0f9 Peter Griffin 2015-07-30  614  	/* Get base addpress of pointer record block from DMEM */
c5f5d0f9 Peter Griffin 2015-07-30  615  	tsin->irec = fei->io + DMA_MEMDMA_OFFSET + DMA_DMEM_OFFSET +
c5f5d0f9 Peter Griffin 2015-07-30  616  			readl(fei->io + DMA_PTRREC_BASE);
c5f5d0f9 Peter Griffin 2015-07-30  617  
c5f5d0f9 Peter Griffin 2015-07-30  618  	/* fill out pointer record data structure */
c5f5d0f9 Peter Griffin 2015-07-30  619  
c5f5d0f9 Peter Griffin 2015-07-30  620  	/* advance pointer record block to our channel */
c5f5d0f9 Peter Griffin 2015-07-30  621  	tsin->irec += (tsin->tsin_id * DMA_PRDS_SIZE);
c5f5d0f9 Peter Griffin 2015-07-30  622  
c5f5d0f9 Peter Griffin 2015-07-30  623  	writel(tsin->fifo, tsin->irec + DMA_PRDS_MEMBASE);
c5f5d0f9 Peter Griffin 2015-07-30  624  
c5f5d0f9 Peter Griffin 2015-07-30  625  	writel(tsin->fifo + FIFO_LEN - 1, tsin->irec + DMA_PRDS_MEMTOP);
c5f5d0f9 Peter Griffin 2015-07-30  626  
c5f5d0f9 Peter Griffin 2015-07-30  627  	writel((188 + 7)&~7, tsin->irec + DMA_PRDS_PKTSIZE);
c5f5d0f9 Peter Griffin 2015-07-30  628  
c5f5d0f9 Peter Griffin 2015-07-30  629  	writel(0x1, tsin->irec + DMA_PRDS_TPENABLE);
c5f5d0f9 Peter Griffin 2015-07-30  630  
c5f5d0f9 Peter Griffin 2015-07-30  631  	/* read/write pointers with physical bus address */
c5f5d0f9 Peter Griffin 2015-07-30  632  
c5f5d0f9 Peter Griffin 2015-07-30  633  	writel(tsin->back_buffer_busaddr, tsin->irec + DMA_PRDS_BUSBASE_TP(0));
c5f5d0f9 Peter Griffin 2015-07-30  634  
c5f5d0f9 Peter Griffin 2015-07-30  635  	tmp = tsin->back_buffer_busaddr + FEI_BUFFER_SIZE - 1;
c5f5d0f9 Peter Griffin 2015-07-30  636  	writel(tmp, tsin->irec + DMA_PRDS_BUSTOP_TP(0));
c5f5d0f9 Peter Griffin 2015-07-30  637  
c5f5d0f9 Peter Griffin 2015-07-30  638  	writel(tsin->back_buffer_busaddr, tsin->irec + DMA_PRDS_BUSWP_TP(0));
c5f5d0f9 Peter Griffin 2015-07-30  639  	writel(tsin->back_buffer_busaddr, tsin->irec + DMA_PRDS_BUSRP_TP(0));
c5f5d0f9 Peter Griffin 2015-07-30  640  
c5f5d0f9 Peter Griffin 2015-07-30  641  	/* initialize tasklet */
c5f5d0f9 Peter Griffin 2015-07-30  642  	tasklet_init(&tsin->tsklet, channel_swdemux_tsklet,
c5f5d0f9 Peter Griffin 2015-07-30  643  		(unsigned long) tsin);
c5f5d0f9 Peter Griffin 2015-07-30  644  
c5f5d0f9 Peter Griffin 2015-07-30  645  	return 0;
c5f5d0f9 Peter Griffin 2015-07-30  646  
c5f5d0f9 Peter Griffin 2015-07-30  647  err_unmap:
c5f5d0f9 Peter Griffin 2015-07-30  648  	free_input_block(fei, tsin);
c5f5d0f9 Peter Griffin 2015-07-30  649  	return ret;
c5f5d0f9 Peter Griffin 2015-07-30  650  }
c5f5d0f9 Peter Griffin 2015-07-30  651  

:::::: The code at line 590 was first introduced by commit
:::::: ee105cac24693c8f3ea92e1700d5d16c4b035eb5 [media] c8sectpfe: Demote print to dev_dbg

:::::: TO: Peter Griffin <peter.griffin@linaro.org>
:::::: CC: Mauro Carvalho Chehab <mchehab@osg.samsung.com>

---
0-DAY kernel test infrastructure                Open Source Technology Center
https://lists.01.org/pipermail/kbuild-all                   Intel Corporation

--uAKRQypu60I7Lcqm
Content-Type: application/gzip
Content-Disposition: attachment; filename=".config.gz"
Content-Transfer-Encoding: base64

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

--uAKRQypu60I7Lcqm--
