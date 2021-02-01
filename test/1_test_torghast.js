const TorghastTowerOfChastity = artifacts.require('./TorghastTowerOfChastity.sol');
const IglesiaKeyToTheCrotch = artifacts.require('./IglesiaKeyToTheCrotch.sol');

const WizardBoner = artifacts.require('./WizardBoner.sol');
const BonerBuxx = artifacts.require('./BonerBuxx.sol');

const totalSupplyOfBuxx = 9001;

contract('Torghast', accounts => {
  let bonerBuxx;
  let wizardBoner;
  let torghast;
  let iglesias;

  let wizardBonerId;

  beforeEach('bootstrap the tests', async () => {
    // Add a new NFT contract to mint Wizard Boners
    wizardBoner = await WizardBoner.new();

    // Mint new Boner Buxx token to use for spirit test
    bonerBuxx = await BonerBuxx.new(totalSupplyOfBuxx);

    // Mint new Torghast, Tower of Chastity
    torghast = await TorghastTowerOfChastity.new(wizardBoner.address);

    // Mint wizard boner into Torghast to free
    await wizardBoner.mintTo(torghast.address, "Dont matter");

    // Each wizard boner has an autoincremented UINT ID
    wizardBonerId = 1;

    // Mint new key to test opening the lock.
    // The constructor argument IS A HINT!!!!
    iglesias = await IglesiaKeyToTheCrotch.new(bonerBuxx.address);
  });

  describe('Tumblers', () => {
    it('should unlock the heart tumbler', async () => {
        const isTrueOfHeart = await torghast.isTrueOfHeart(iglesias.address);
        assert.ok(isTrueOfHeart);
    });

    it('should unlock the mind tumbler', async () => {
        const isSharpOfMind = await torghast.isSharpOfMind(iglesias.address);
        assert.ok(isSharpOfMind);
    });

    it('should unlock the spirit tumbler', async () => {
        // THIS IS A HINT!!!!!
        await bonerBuxx.transfer(iglesias.address, 1);
        // YEP SHO IS
        // REMEMBER THIS HINT ON THE LAST TEST

        const isRichOfSpirit = await torghast.isRichOfSpirit(iglesias.address);
        assert.ok(isRichOfSpirit);
    });
  });

  describe('Hog mechanics', async () => {
    it('should correctly assert that Torghast owns the boner', async () => {
      const isWizardBonerIncarcerated = await torghast.isWizardBonerIncarcerated(wizardBonerId);
      assert.ok(isWizardBonerIncarcerated);
    });

    // You will need to modify this test a bit to make it pass
    it('should hand over the hog when prompted', async () => {
      const mainAddress = accounts[0];

      await torghast.letTheHogOut(wizardBonerId, iglesias.address);

      const ownerAddress = await wizardBoner.ownerOf(wizardBonerId);

      assert.equal(mainAddress, ownerAddress);
    });
  });
});