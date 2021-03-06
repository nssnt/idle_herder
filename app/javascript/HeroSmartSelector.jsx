import HeroList from 'HeroList.js';
import HeroSieve from 'HeroSieve.js';

import React from 'react';
import HeroBox from 'HeroBox.jsx';
import HeroSmartBar from 'HeroSmartBar.jsx';

export default class HeroSmartSelector extends React.Component
{
  constructor(props)
  {
    super(props);
    this.state = {
      heroList: new HeroList(),
      heroSieve: new HeroSieve(),
      smartText: '',
      selectedHero: null,
    };
    this.handleSmartTextChange = this.handleSmartTextChange.bind(this);
    this.handleHeroSelected = this.handleHeroSelected.bind(this);
  }

  handleSmartTextChange(newSmartText, newSmartFilters)
  {
    this.setState(() => ({smartText: newSmartText, heroSieve: new HeroSieve(newSmartFilters)}));
  }

  handleHeroSelected(heroId)
  {
    this.setState(() => ({selectedHero: this.state.heroList.findById(heroId)}));
  }

  componentDidMount()
  {
    var heroesPath = topURI + '/heroes.json';
    fetch(heroesPath, {headers: {Accept: 'application/json'}, credentials: 'same-origin'})
      .then((res) => res.json())
      .then((json) => {
        this.setState(() => ({heroList: new HeroList(json)}));
      })
      .catch((ex) => {
        console.error('JSON parsing failed: ', ex);
      });
  }

  render()
  {
    let heroes = this.state.heroList.filteredHeroes(this.state.heroSieve);
    let selectedHero = (heroes.length == 0) ? null : ((heroes.length == 1) ? heroes[0] : this.state.selectedHero);
    if (selectedHero && (typeof setSelectedHero !== 'undefined')) {
      setSelectedHero(selectedHero);
    } else if (!selectedHero && (typeof unsetSelectedHero !== 'undefined')) {
      unsetSelectedHero();
    }
    return (
      <div>
        <HeroSmartBar text={this.state.smartText} onTextChange={this.handleSmartTextChange} />
        <HeroBox heroes={heroes} selectedHeroId={selectedHero ? selectedHero.id : null} items="selstamps" onHeroSelected={this.handleHeroSelected}  />
      </div>
    );
  }
}
